library(RCurl)

SERVER_ROOT = "/reference"

DATA_IOTC_SERVER_IP = Sys.getenv("DATA_IOTC_SERVER_IP")
DATA_IOTC_USERNAME  = Sys.getenv("DATA_IOTC_USERNAME")
DATA_IOTC_PASSWORD  = Sys.getenv("DATA_IOTC_PASSWORD")

print(paste0("IOTC data server IP: ", DATA_IOTC_SERVER_IP))
print(paste0("IOTC data username : ", DATA_IOTC_USERNAME))
print(paste0("IOTC data password : ", str_replace_all(DATA_IOTC_PASSWORD, ".", "*")))

CURL_CMD = function(url, cmd) {
  curlPerform(url = url, quote = cmd)
}

CURL_FTPu = function(filename, target_url, asText = FALSE) {
  ftpUpload(what = filename, 
            to = target_url, 
            asText = asText,
            .opts = list(ftp.create.missing.dirs = TRUE))
  #curl_upload(filename, target_url)
}

check_connection = function(command) {
  if(!can_connect()) 
    stop(
      paste0("Cannot connect with remote server at ", DATA_IOTC_SERVER_IP, " using ", DATA_IOTC_USERNAME, " as username: please check that server IP and credentials are correct...")
    )
}

userpwd = function() {
  return(paste0(DATA_IOTC_USERNAME, ":", DATA_IOTC_PASSWORD))
}

ftp_root = function() {
  return(ftp_url())
}

ftp_url = function(path = NA) {
  return(
    paste0(
      "sftp://", 
      userpwd(), 
      "@", DATA_IOTC_SERVER_IP, 
      ifelse(is.na(path), "", paste0("/", path))
    )
  )
}

can_connect = function() {
  return(url.exists(ftp_url(), userpwd = userpwd()))
}

full_folder = function(version, folder = NA) {
  return(
    paste0(SERVER_ROOT, "/", version, ifelse(is.na(folder), "", paste0("/", folder)))
  )
}

create_folder = function(version, folder) {
  folder = paste0(full_folder(version, folder), "/")
  
  print(paste0("Creating empty remote folder ", folder, "..."))
  
  cmd = paste0("mkdir ", folder)
  
  CURL_CMD(ftp_root(), cmd)
}

initialize_folder = function(version, folder) {
  folder = full_folder(version, folder)
  
  print(paste0("FOLDER: ", folder))
  
  if(url.exists(ftp_url(folder), userpwd = userpwd())) {
    print(paste0("Remote folder ", folder, " already exists...")) 
  } else {
    print(paste0("Creating empty remote folder ", folder, "..."))
    
    cmd = paste0("mkdir ", folder)
    
    CURL_CMD(ftp_root(), cmd)
  }
}

initialize_version = function(version) {
  check_connection()
  
  folder = full_folder(version)
  
  if(url.exists(ftp_url(folder))) {
    print(paste0("Remote folder for version ", version, " already exists... Skipping folder creation."))
  } else {
    print(paste0("Creating remote folder for version '", version, "'..."))
    
    CURL_CMD(ftp_root(), paste0("mkdir ", folder))
  }
}

upload_docs = function(version, target_subfolder = "guidelines") {
  remote_folder = paste0(full_folder(version), "/", target_subfolder)
  
  for(doc in list.files("./outputs/html/", pattern = "*.html")) {
    print(paste0("Uploading  document ", doc, " in ", remote_folder, "..."))
    
    CURL_FTPu(
      filename   = paste0("./outputs/html/", doc), 
      target_url = paste0(ftp_url(remote_folder), "/", doc) 
    )
  }
}

disseminate = function(version) {
  upload_docs(version)
}

version = "1.0.0"
disseminate(version) 
