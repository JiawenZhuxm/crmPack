##Update the 'EffFlexi' model with new data
## first define the data and the model
emptydata<-DataDual(doseGrid=seq(25,300,25))
data<-emptydata

Effmodel<- EffFlexi(Eff=c(1.223, 2.513),Effdose=c(25,300),
                    sigma2=c(a=0.1,b=0.1),sigma2betaW=c(a=20,b=50),smooth="RW2",data=data)


##Then we have some new observations data
data<-DataDual(x=c(25,50,50,75,100,100,225,300),y=c(0,0,0,0,1,1,1,1),
               w=c(0.31,0.42,0.59,0.45,0.6,0.7,0.6,0.52),
               doseGrid=seq(25,300,25))

##update the model to get new estimates
newEffModel <- update(object=Effmodel,data=data)