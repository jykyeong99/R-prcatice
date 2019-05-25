install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk-11.0.2")
library(KoNLP)
library(dplyr)
useNIADic()
txt<-readLines("hiphop.txt")
install.packages("stringr")
library(stringr)
txt<-str_replace_all(txt,"\\W"," ")
nouns<-extractNoun(txt)
wordcount<-table(unlist(nouns))
df_word<-as.data.frame(wordcount,stringsAsFactors = F)
df_word<-rename(df_word,
                word = Var1,
                freq = Freq)
df_word<-filter(df_word,nchar(word)>=2)
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)
pal<-brewer.pal(8,"Greens")
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq=2,
          max.words=200,
          random.order=F,
          rot.per=.1,
          scale=c(4,0.3),
          colors=pal)
