
print("Initializing table of reporting requirements...")

NC_COLOR = lighten(colors_for_fishery_group("LL")$FILL, amount = 0.4)
DI_COLOR = colors_for_fishery_group("PS")$FILL
FC_COLOR = "wheat"
CE_COLOR = colors_for_fishery_group("GN")$FILL
SF_COLOR = colors_for_fishery_group("LI")$FILL
ROS_COLOR= colors_for_fishery_group("BB")$FILL
FP_COLOR = colors_for_fishery_group("OT")$FILL

# Read the XLSX table of reporting requirements

REPORTING_TABLE = read.xlsx("../inputs/data/Datasets_table.xlsx", sep.names = " ", sheet = "TABLE")

REPORTING_TABLE_FT =
  REPORTING_TABLE %>%
  prepare_flextable(default_bg_highlight = FALSE, default_text_highlight = FALSE, font_size_header = 8, font_size_body = 8) %>%
  bold(    i = 1, part = "header") %>%
  fontsize(i = 1, part = "header", size = 11) %>%
  #bold(    j = 1:4, part = "body") %>%
  fontsize(j = 1:4, part = "body", size = 11) %>%
  align(align = "center", part = "header") %>%
  align(j = 2:6, align = "center", part = "body") %>%
  merge_at(i = 1:3, j = 2) %>%
  merge_at(i = 1:3, j = 3) %>%
  merge_at(i = 1:3, j = 5) %>%
  merge_at(i = 1:2, j = 6) %>%
  merge_at(i = 4:11, j = 2) %>%
  merge_at(i = 4:11, j = 3) %>%
  merge_at(i = 4:11, j = 5) %>%
  merge_at(i = 4:10, j = 6) %>%
  merge_at(i = 13:17, j = 2) %>%
  merge_at(i = 13:17, j = 3) %>%
  merge_at(i = 13:17, j = 5) %>%
  merge_at(i = 13:17, j = 6) %>%
  merge_at(i = 18:26, j = 2) %>%
  merge_at(i = 18:20, j = 3) %>%
  merge_at(i = 18:20, j = 5) %>%
  merge_at(i = 18:19, j = 6) %>%
  merge_at(i = 21:23, j = 3) %>%
  merge_at(i = 21:23, j = 5) %>%
  merge_at(i = 21:22, j = 6) %>%
  merge_at(i = 24:26, j = 3) %>%
  merge_at(i = 24:26, j = 5) %>%
  merge_at(i = 24:25, j = 6) %>%
  merge_at(i = 30:32, j = 2) %>%
  merge_at(i = 30:32, j = 3) %>%
  merge_at(i = 30:32, j = 5) %>%
  merge_at(i = 30:31, j = 6) %>%
  width(width = c(2, 1, 1, 1, 1.5, 1.5)) %>%
  border_inner(border = fp_border(color = "black", style = "solid", width = 1)) %>%
  border_outer(border = fp_border(color = "black", style = "solid", width = 2)) %>%
  flextable::border(part = "body", i = c(3, 11, 12, 17, 20, 23, 26,27,28,29,32,33,34,35), border.bottom = fp_border(width = 2)) %>%
  flextable::border(part = "all", j = c(1,2,3,4,5), border.right = fp_border(width = 2)) %>%
  bg(part = "header", bg = "grey") %>%
  fix_border_issues(part = "all")

print("Reporting requirements table initialized!")

