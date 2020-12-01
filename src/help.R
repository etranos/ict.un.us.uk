a <- read_csv("C:/Users/nw19521/OneDrive - University of Bristol/projects/Ioannides/ict.un.us.uk/data/data_inter/data_for_uk_regressions.csv")
glimpse(a)

cor(I(a$n.tests2011/a$pop2011), a$download2011)

cor((a$n.tests2011), a$download2011)

cor(I(a$uni.freq/a$pop2011), a$download2011)

model_iv1_s1 <- lm(log(download2011) ~ log(pop2011) + I(n.tests2011/pop2011) + unemployment.share + 
                     british.pop.share +  pop.dens + work.home.share + services.share + n.tests2011, data = a, subset = n.tests2011>30)
summary(model_iv1_s1)


us <- read_csv("C:/Users/nw19521/OneDrive - University of Bristol/projects/Ioannides/ict.un.us.uk/data/data_inter/data_for_usa_regressions.csv")

summary(model_iv1 <- lm(hh.net.share ~ log(pop2013) + un13 + white2013share +
                             log(income2013) + I(pop2013/area_h) + service2013 + commuting.minutes2013 +
                             bachelors2005, data = us))

t.test(model_iv1$coefficients[9], 0)
car::linearHypothesis(model_iv1, c("bachelors2005=0"))



# counter cumulatve
#pop_i = popd*r_i^{-a}

rank <- c(1:1000)
pop_0 <- 30000000
# a <- 1
# a <- 1.095888

# zipf plot
pop.zipf <- pop_0*rank^(-1)
pop.zipf <- as.data.frame(pop.zipf)

pop.mean <- pop_0*rank^(-1.095888)
pop.mean <- as.data.frame(pop.mean)

pop.test <- pop_0*rank^(-1.095888 + .0003)
pop.test <- as.data.frame(pop.test)

pop <- cbind(pop.mean, pop.zipf, pop.test)
pop$rank <- c(1:1000)

pop.long <- pivot_longer(pop, !rank, names_to = "distr", values_to = "pop")

ggplot(data=pop.long,
       aes(x=rank, y=pop, colour=distr)) +
  geom_line() +
  scale_x_log10()+#, limits = c(NA, 6000000)) +
  scale_y_log10() 



ggplot() + 
  geom_line(data=pop, aes(x= rank, y = pop.mean, color='green')) +
  geom_line(data=pop, aes(x= rank, y = pop.zipf, color='red')) + 
  geom_line(data=pop, aes(x= rank, y = pop.test)) + 
  #geom_line(data=PDF.data, aes(y= PDF.1sd, x = pop)) + 
  #xlim(6000, 6000000) +
  scale_x_log10()+#, limits = c(NA, 6000000)) +
  scale_y_log10() 



p.zipf <- ecdf(pop.zipf)
p.mean <- ecdf(pop.mean)

ggplot(as.data.frame(pop.zipf), aes(pop.zipf)) + 
  stat_ecdf(geom = "point") 
  #scale_x_log10() +
  #scale_y_log10()



p(10000)

plot(p.zipf)
plot(p.mean)

plot(p.zipf, xlim=c(0,1), log = 'x')

counter <- c()
for (i in pop){
  cc <- 1-p(i) 
  counter <- c(counter,cc)
}

data <- cbind(counter, pop)

plot(data, log = "xy")

library(ggplot2)
ggplot(data=as.data.frame(data[-1,]), aes(y=counter, x=pop, group=1)) +
  geom_line()  + 
  # scale_x_continuous(trans='log2') +
  # scale_y_continuous(trans='log2') 
  scale_x_log10() +
  scale_y_log10()

ggplot(p(pop))  

ggplot(as.data.frame(pop), aes(pop)) + stat_ecdf(geom = "step") +
  scale_x_log10() +
  scale_y_log10()


options(scipen=999)

library(sads)
CDF <- pzipf(q=(1:1000), N=1000, s=1)
plot(pop, CDF, log = 'yx')

PDF.zipf <- dzipf(x=1:1000, N=1000, s=1)
plot(pop.zipf,PDF.zipf, log = 'yx')

PDF.mean <- dzipf(x=1:1000, N=1000, s=1)
plot(pop.mean,PDF.mean, log = 'yx')

CDF.zipf <- qzipf(p=PDF.zipf, N=1000, s=1)
plot(pop.zipf,CDF.zipf, log = 'yx')

CDF.mean <- qzipf(p=PDF.mean, N=1000, s=1)
plot(pop.mean,CDF.mean, log = 'yx')



ind2017<- urban.pop %>%
  dplyr::filter(ISO=="IND") %>%
  dplyr::select(pop2017)
range(ind2017$pop2017)

PDF.median <- dzipf(x=ind2017$pop2017, N=181, s=1.09049)
plot(ind2017$pop2017,PDF.median)#, log = 'yx')


PDF.1sd <- dzipf(x=1:1000, N=1000, s=(1.095888+.00087))
plot(pop,PDF.1sd, log = 'yx')


PDF.data <- as.data.frame(cbind(pop.zipf, pop.mean, PDF.zipf, PDF.mean)) #PDF.1sd

ggplot() + 
  geom_line(data=PDF.data, aes(y= PDF.zipf, x = pop.zipf, color='red')) +
  geom_line(data=PDF.data, aes(y= PDF.mean, x = pop.mean)) + 
  #geom_line(data=PDF.data, aes(y= PDF.1sd, x = pop)) + 
  #xlim(6000, 6000000) +
  scale_x_log10()+#, limits = c(NA, 6000000)) +
  scale_y_log10() 

ggplot() + 
  geom_line(data=PDF.data, aes(y= 1-PDF.zipf, x = pop.zipf, color='red')) +
  geom_line(data=PDF.data, aes(y= 1-PDF.mean, x = pop.mean)) + 
  #geom_line(data=PDF.data, aes(y= PDF.1sd, x = pop)) + 
  #xlim(6000, 6000000) +
  scale_x_log10()+#, limits = c(NA, 6000000)) +
  scale_y_log10() 
