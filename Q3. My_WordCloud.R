#get current working directory
getwd()

#change working directory to required folder
path_str <- r"(C:\Users\USER\Documents\SDSU\BDA 549\Assignments\R)"
setwd(path_str)

#installing required packages
pack = list("tm","wordcloud","RColorBrewer","NLP","stringr","SnowballC","rvest")
for(i in pack) {
  print(i)
  if (!require(i))
  {
    install.packages(i)
    print(paste(i , "was installed"))
  }
  else
  {
    print(paste(i,"already installed"))
  }
}

#loading all libraries
for (i in 1:length(pack)){
  library(pack[[i]][1],character.only = TRUE)
}
########################################################################################################################

#Creating word cloud from web page:

########################################################################################################################
library(SnowballC)

link = "https://en.wikipedia.org/wiki/Big_data"

# Taking the body of the page as text
text <- html_text(read_html(link) %>% html_nodes("body"))

# Cleaning the data of tabs and new lines
text <- gsub("\n", "", gsub("\t", "", text))

# Keeping only the definition for analysis
strt <- unlist(gregexpr('[1]', text))[2]     
stp <- unlist(gregexpr('Architecture', text))[2]
text2 <- substr(text, strt, stp)

my_corpus = Corpus(VectorSource(text2))
tdm = TermDocumentMatrix(my_corpus,
                         control = list(removePunctuation = TRUE,
                                        stopwords = c("may","things","often","every","also","can",
                                                      "example","refers","new","use","include","big","data",
                                                      stopwords("english")),removeNumbers = TRUE, tolower = TRUE,
                                        list(minWordLength = 1)))
# define tdm as matrix
m = as.matrix(tdm)                

word_freqs = sort(rowSums(m), decreasing=TRUE)

# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)


# plot wordcloud in R
set.seed(123)
wordcloud(dm$word, dm$freq, random.order=FALSE, random.color=FALSE, rot.per= 0, colors=brewer.pal(8, "Dark2"),scale=c(.75,1))

# save the image in png format – a PNG image will be created in the Working Directory
png("My_WordCloud_v3.png", width=12, height=12, units="in", res=500)
wordcloud(dm$word, dm$freq, random.order=FALSE, random.color=FALSE, rot.per= 0, colors=brewer.pal(8, "Dark2"))
# dev.off will save the output PNG file into the working folder
dev.off()