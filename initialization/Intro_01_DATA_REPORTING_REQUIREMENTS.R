
print("Initializing table of reporting requirements...")

NC_COLOR = lighten(colors_for_fishery_group("LL")$FILL, amount = 0.4)
DI_COLOR = colors_for_fishery_group("PS")$FILL
FC_COLOR = "wheat"
CE_COLOR = colors_for_fishery_group("GN")$FILL
SF_COLOR = colors_for_fishery_group("LI")$FILL
ROS_COLOR= colors_for_fishery_group("BB")$FILL
FP_COLOR = colors_for_fishery_group("OT")$FILL

# Read the XLSX table of reporting requirements

REPORTING_TABLE = read.xlsx("../inputs/data/DataRequirements.xlsx", sep.names = " ", sheet = "TABLE")

REPORTING_TABLE_FT =
  REPORTING_TABLE %>%
  prepare_flextable(default_bg_highlight = FALSE, default_text_highlight = FALSE, font_size_header = 8, font_size_body = 8) %>%
  bold(    i = 1, part = "header") %>%
  fontsize(i = 1, part = "header", size = 11) %>%
  #bold(    j = 1:4, part = "body") %>%
  fontsize(j = 1:4, part = "body", size = 11) %>%
  align(align = "center", part = "header") %>%
  align(j = 2:6, align = "center", part = "body") %>%
  merge_at(i = 1, j = 5:6) %>%
  merge_at(i = 2, j = 5:6) %>%
  merge_at(i = 3, j = 5:6) %>%
  merge_at(i = 4, j = 5:6) %>%
  merge_at(i = 10, j = 5:6) %>%
  merge_at(i = 1:2, j = 1) %>%
  merge_at(i = 1:2, j = 2) %>%
  merge_at(i = 3:4, j = 1) %>%
  merge_at(i = 3:4, j = 2) %>%
  #merge_at(i = 6:7, j = 2) %>%
  #merge_at(i = 6:7, j = 3) %>%
  merge_at(i = 8:9, j = 1) %>%
  #merge_at(i = 8:9, j = 3) %>%
  merge_at(i = 12, j = 5:6) %>%
  width(width = c(2, 1, 1, 1, 1.5, 1.5)) %>%
  border_inner(border = fp_border(color = "black", style = "solid", width = 1)) %>%
  border_outer(border = fp_border(color = "black", style = "solid", width = 2)) %>%
  flextable::border(part = "body", i = c(2, 4, 5, 9, 10, 11, 12), border.bottom = fp_border(width = 2)) %>%
  flextable::border(part = "all", j = c(2, 4), border.right = fp_border(width = 2)) %>%
  bg(part = "header", bg = "grey") %>%
  bg(part = "body", i =  1:2, bg = NC_COLOR) %>%
  bg(part = "body", i =    2, bg = lighten(NC_COLOR, amount = 0.2), j = 3:6) %>%
  bg(part = "body", i =  3:4, bg = DI_COLOR) %>%
  bg(part = "body", i =    4, bg = lighten(DI_COLOR, amount = 0.2), j = 3:6) %>%
  bg(part = "body", i =    5, bg = FC_COLOR) %>%
  bg(part = "body", i =    5, bg = lighten(FC_COLOR, amount = 0.2), j = 3:6) %>%
  bg(part = "body", i =  6:9, bg = CE_COLOR) %>%
  bg(part = "body", i =    7, bg = darken(CE_COLOR, amount = 0.1)) %>%
  bg(part = "body", i =  8:9, bg = darken(CE_COLOR, amount = 0.2)) %>%
  bg(part = "body", i =   10, bg = SF_COLOR) %>%
  bg(part = "body", i =   11, bg = ROS_COLOR) %>%
  bg(part = "body", i =   12, bg = FP_COLOR) %>%
  bg(part = "body", i =   12, bg = lighten(FP_COLOR, amount = 0.2), j = 3:6) %>%
  fix_border_issues(part = "all")

print("Reporting requirements table initialized!")