 #### rvest ####
 
 # 2020.07.22 study start
 
 library(rvest)
 
 url <- "http://biz.newdaily.co.kr/site/data/html/2020/07/22/2020072200139.html"

 read_html(url)
 
 read_html(url) %>% html_nodes("section h1") %>% html_text
