# 1.rvest ####  # 2020.07.22 study start

library(rvest)

url <- "http://biz.newdaily.co.kr/site/data/html/2020/07/22/2020072200139.html"

read_html(url)

read_html(url) %>% html_nodes("section h1") %>% html_text()

read_html(url) %>% html_nodes("section h1") %>% html_attr("class")

# 2.httr ####

#2.1 libarary

library(httr)
library(dplyr)

url<-"http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=437&aid=0000165410"

#2.2 get

dat <- GET(url)

content(dat)

GET("https://httpbin.org/get") %>% content()

#https://httpbin.org/get

GET("https://httpbin.org/get") %>% content

###  <httr::add_headers> user-agent 변환 

#2.3 post

body<-list(sent="아래와같은방식으로API를사용할수있으며,호출건수에대해서별도의제한은없으나,1회 호출에200글자로글자수를제한하고있다.")

body

?POST

res<-PUT(url='http://35.201.156.140:8080/spacing', body=body)

tar <-  "https://apis.naver.com/commentBox/cbox/web_naver_list_jsonp.json?ticket=sports&templateId=view&pool=cbox2&_callback=jQuery1113011978216104312311_1595656809548&lang=ko&country=KR&objectId=news119%2C0002417137&categoryId=&pageSize=20&indexSize=10&groupId=&listType=OBJECT&pageType=more&page=1&refresh=true&sort=new&_=1595656809550"

GET(tar) %>% content(encording = 'raw') %>% rawToChar() -> temp

Encoding(temp)

Encoding(temp) <- "UTF-8"

temp

# [1] "jQuery1113011978216104312311_1595656809548({\"success\":false,\"code\":\"3999\",\"message\":\"잘못된 접근입니다.\",\"lang\":\"ko\",\"country\":\"KR\",\"result\":{},\"date\":\"2020-07-25T06:04:11+0000\"});"


# add_headers 추가 / request referer 조정  

# referer: https://sports.news.naver.com/news.nhn?oid=119&aid=0002417137&m_view=1&sort=LIKE

ah <- add_headers("referer" = "https://sports.news.naver.com/news.nhn?oid=119&aid=0002417137&m_view=1&sort=LIKE")

GET(tar, ah) %>% content(encording = 'raw') %>% rawToChar() -> temp

Encoding(temp)

Encoding(temp) <- "UTF-8"

temp
