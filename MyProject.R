getwd()

setwd("E:/InternshipProject/Data")



library(openxlsx)
library(ggplot2)

  
SATIS = read.xlsx("Data.xlsx", sheet=1)

STOK = read.xlsx("Data.xlsx", sheet=2)

URUN = read.xlsx("Data.xlsx", sheet=3)

BOLGE = read.xlsx("Data.xlsx", sheet=4)




K = factor(SATIS$AY, levels=c(1,2))

SATIS$URUN = as.factor(SATIS$URUN)
SATIS$BOLGE = as.factor(SATIS$BOLGE)

ggplot(data = SATIS[1:3575,]) + geom_bar(mapping = aes(x = BOLGE , y = MIKTAR , fill = URUN), stat = "identity")+ ggtitle ("2015 Illere göre Ürün miktarlari") 
ggplot(data = SATIS[3576:7271,]) + geom_bar(mapping = aes(x = BOLGE , y = MIKTAR , fill = URUN), stat = "identity")+ ggtitle ("2016 Illere göre Ürün miktarlari") 
ggplot(data = SATIS[7272:10967,]) + geom_bar(mapping = aes(x = BOLGE , y = MIKTAR , fill = URUN), stat = "identity")+ ggtitle ("2017 Illere göre Ürün miktarlari") 
ggplot(data = SATIS[10968:12815,]) + geom_bar(mapping = aes(x = BOLGE, y = MIKTAR , fill = URUN), stat = "identity")+ ggtitle ("2018 Illere göre Ürün miktarlari") 
ggplot(data =SATIS[1:3575,]) + geom_bar(mapping = aes(x = URUN, y = MIKTAR , fill = BOLGE),position = "fill",stat ="identity") + ggtitle ("2015 Ürünlerin illere satis oranlari" )

??join

STOK$URUN=as.factor(STOK$URUN)
STOK$BOLGE=as.factor(STOK$BOLGE)
ggplot(data=STOK[1:2916,])+geom_bar(mapping=aes(x=BOLGE,y=MAKTA,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre MAKTA")
ggplot(data=STOK[2917:5940,])+geom_bar(mapping=aes(x=BOLGE,y=MAKTA,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre MAKTA")
ggplot(data=STOK[5941:8964,])+geom_bar(mapping=aes(x=BOLGE,y=MAKTA,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre MAKTA")
ggplot(data=STOK[8965:10476.,])+geom_bar(mapping=aes(x=BOLGE,y=MAKTA,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre MAKTA")
##rampa
ggplot(data=STOK[1:2916,])+geom_bar(mapping=aes(x=BOLGE,y=RAMPA,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre RAMPA")
ggplot(data=STOK[2917:5940,])+geom_bar(mapping=aes(x=BOLGE,y=RAMPA,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre RAMPA")
ggplot(data=STOK[5941:8964,])+geom_bar(mapping=aes(x=BOLGE,y=RAMPA,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre RAMPA")
ggplot(data=STOK[8965:10476.,])+geom_bar(mapping=aes(x=BOLGE,y=RAMPA,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre RAMPA")
##satis deposu
ggplot(data=STOK[1:2916,])+geom_bar(mapping=aes(x=BOLGE,y=SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre SATIS DEPOSU")
ggplot(data=STOK[2917:5940,])+geom_bar(mapping=aes(x=BOLGE,y=SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre SATIS DEPOSU")
ggplot(data=STOK[5941:8964,])+geom_bar(mapping=aes(x=BOLGE,y=SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre SATIS DEPOSU")
ggplot(data=STOK[8965:10476.,])+geom_bar(mapping=aes(x=BOLGE,y=SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre SATIS DEPOSU")
###tablo iliskilendirme

BOLGE$BOLGE=as.character(BOLGE$BOLGE)
STOK$BOLGE=as.character(STOK$BOLGE)
BOLGE$BOLGE_ID=as.character(BOLGE$BOLGE_ID)

library(dplyr)

BOLGELER = inner_join(BOLGE,STOK, by=c("BOLGE_ID"="BOLGE"),copy=TRUE,suffix=c(".BOLGE",".STOK"))
URUNLER = merge(x= BOLGELER, y = URUN ,by.x = "URUN",by.y ="URUN_ID")

?sort

#ASorted = A[with(A, order(YIL)),]

#STOK Sonuç grafikleri
Bolge2015 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2015)
Bolge2016 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2016)
Bolge2017 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2017)
Bolge2018 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2018)
UrBol2015 = subset.data.frame(URUNLER, URUNLER$YIL ==2015)
UrBol2016 = subset.data.frame(URUNLER, URUNLER$YIL ==2016)
UrBol2017 = subset.data.frame(URUNLER, URUNLER$YIL ==2017)
UrBol2018 = subset.data.frame(URUNLER, URUNLER$YIL ==2018)

#2015
ggplot(data = UrBol2015)+ geom_bar(mapping = aes(x = BOLGE, y = MAKTA,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre MAKTA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2015)+ geom_bar(mapping = aes(x = BOLGE, y = RAMPA,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre RAMPA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2015)+ geom_bar(mapping = aes(x = BOLGE, y = SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre SATIS DEPOSU")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
#2016
ggplot(data = UrBol2016)+ geom_bar(mapping = aes(x = BOLGE, y = MAKTA,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre MAKTA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2016)+ geom_bar(mapping = aes(x = BOLGE, y = RAMPA,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre RAMPA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2016)+ geom_bar(mapping = aes(x = BOLGE, y = SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre SATIS DEPOSU")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
#2017
ggplot(data = UrBol2017)+ geom_bar(mapping = aes(x = BOLGE, y = MAKTA,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre MAKTA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2017)+ geom_bar(mapping = aes(x = BOLGE, y = RAMPA,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre RAMPA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2017)+ geom_bar(mapping = aes(x = BOLGE, y = SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre SATIS DEPOSU")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
#2018
ggplot(data = UrBol2018)+ geom_bar(mapping = aes(x = BOLGE, y = MAKTA,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre MAKTA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2018)+ geom_bar(mapping = aes(x = BOLGE, y = RAMPA,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre RAMPA")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = UrBol2018)+ geom_bar(mapping = aes(x = BOLGE, y = SATIS.DEPOSU,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre SATIS DEPOSU")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))

#SATIS Sonuç grafikleri

SATIS$BOLGE=as.character(SATIS$BOLGE)
SATIS$URUN=as.factor(SATIS$URUN)
BOLGE$BOLGE_ID=as.character(BOLGE$BOLGE_ID)

BOLGELER = inner_join(BOLGE,SATIS, by=c("BOLGE_ID"="BOLGE"),copy=TRUE,suffix=c(".BOLGE",".SATIS"))
URUNLER = inner_join(URUN,BOLGELER, by=c("URUN_ID"="URUN"),copy=TRUE,suffix=c(".URUN",".BOLGELER"))


SBolge2015 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2015)
SBolge2016 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2016)
SBolge2017 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2017)
SBolge2018 = subset.data.frame(BOLGELER, BOLGELER$YIL ==2018)
SUrBol2015 = subset.data.frame(URUNLER, URUNLER$YIL ==2015)
SUrBol2016 = subset.data.frame(URUNLER, URUNLER$YIL ==2016)
SUrBol2017 = subset.data.frame(URUNLER, URUNLER$YIL ==2017)
SUrBol2018 = subset.data.frame(URUNLER, URUNLER$YIL ==2018)


#2015
ggplot(data = SUrBol2015)+ geom_bar(mapping = aes(x = BOLGE, y = MIKTAR,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre MIKTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = SUrBol2015)+ geom_bar(mapping = aes(x = BOLGE, y = TUTAR,fill=URUN),stat="identity")+ggtitle("2015 Illere Göre TUTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
#2016
ggplot(data = SUrBol2016)+ geom_bar(mapping = aes(x = BOLGE, y = MIKTAR,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre MIKTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = SUrBol2016)+ geom_bar(mapping = aes(x = BOLGE, y = TUTAR,fill=URUN),stat="identity")+ggtitle("2016 Illere Göre TUTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
#2017
ggplot(data = SUrBol2017)+ geom_bar(mapping = aes(x = BOLGE, y = MIKTAR,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre MIKTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = SUrBol2017)+ geom_bar(mapping = aes(x = BOLGE, y = TUTAR,fill=URUN),stat="identity")+ggtitle("2017 Illere Göre TUTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
#2018
ggplot(data = SUrBol2018)+ geom_bar(mapping = aes(x = BOLGE, y = MIKTAR,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre MIKTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(data = SUrBol2018)+ geom_bar(mapping = aes(x = BOLGE, y = TUTAR,fill=URUN),stat="identity")+ggtitle("2018 Illere Göre TUTAR")+ theme(axis.text.x = element_text(angle = 45, hjust = 1))


### Prediction 


library(randomForest)

Train = SATIS[1:10967,]
Test = SATIS[10968:12815,]


##rf = randomForest( MIKTAR ~ AY + URUN + BOLGE, data = Train, mtry = 2, ntree = 1000)

tahminler = predict ( rf, Test[,2:4])


#table ( "Tahminler" = tahminler, "Test" =  Test$MIKTAR)


##tablo = data.frame("Tahminler" = round(as.double(tahminler),digits = 3), "Test" =  round(as.double(Test$MIKTAR),digits = 3))


## Bölgelere göre Satis Grafikleri
library(easyGgplot2)

Fin = rbind(SUrBol2015,SUrBol2016,SUrBol2017,SUrBol2018)

Fin$AY = as.factor(Fin$AY)
Bol_tab = function(x,y){
  
  a = subset.data.frame(Fin,Fin$BOLGE_ID==x)
  a = subset.data.frame(Fin,Fin$YIL==y)
  k = BOLGE[x,2]
  
  g1 = ggplot(data = a) + geom_bar(mapping = aes(x = AY, y = MIKTAR, fill = URUN), stat = "identity" )+ggtitle(k, "Bolgesi Satis Miktari")+ theme(legend.position = "None")
  g2 = ggplot(data = a) + geom_bar(mapping = aes(x = AY, y = TUTAR, fill = URUN), stat = "identity" )+ggtitle(k, "Bolgesi Satis Tutari")
  ggplot2.multiplot(g1,g2)
  
}
  
  

Bol_tab(1,2015)
Bol_tab(2,2016)
Bol_tab(3,2017)
Bol_tab(4,2018)
Bol_tab(5,2015)


## Bölgelere göre Satis Grafikleri



