# install.packages(c("dplyr","lubridate","ggplot2"))
library(dplyr)
library(lubridate)
library(ggplot2)

datCO2 <- read.csv("/cloud/project/activity03/annual-co-emissions-by-region.csv")

colnames(datCO2)

# change the 4 column name
colnames(datCO2)[4] <- "CO2"
# check names again
colnames(datCO2)

plot(datCO2$Year, datCO2$CO2, xlab = "Year", ylab = "C02 Emissions", type = 'l')

NA_CO <- datCO2 %>% filter(Entity == "United States" |
                   Entity == "Canada" |
                   Entity == "Mexico", )

ggplot(datCO2, aes(x = Year, y = CO2, color = Entity)) + 
  geom_line()

ggplot(NA_CO, aes(x = Year, y = CO2, color = Entity)) + 
  geom_line()

########## Class Work

# Plot of air temperature anomalies in Base R
climate_data <- read.csv("/cloud/project/activity03/climate-change.csv")

climate_data$time <- ymd(climate_data$Day)

plot(climate_data$time, climate_data$temperature_anomaly)

Northern <- climate_data %>% filter(Entity == "Northern Hemisphere")
Southern <- climate_data %>% filter(Entity == "Southern Hemisphere")

plot(Northern$time, Northern$temperature_anomaly, xlab = "Time", ylab = "Temperature Anomaly",
     main = "Temperature Anomalies for Northern and Southern Hemispheres")
points(Southern$time, Southern$temperature_anomaly, col = 'green')

ggplot(climate_data, aes(x = time, y = temperature_anomaly, color = Entity)) + 
  geom_line()

no_world <- climate_data %>% filter(Entity != "World")

ggplot(no_world, aes(x = time, y = temperature_anomaly, color = Entity)) + 
  geom_line()

# All time emissions for U.S., Mexico, and Canada

ggplot(NA_CO, aes(x = Year, y = CO2, color = Entity)) + 
  geom_line() + 
  labs(x = "Year", y = expression(CO[2]))
  
#Homework
###############################################################################

# Question 1 - Emissions from Selected Country

Turkey_data <- datCO2 %>% filter(Entity == "Turkey")

ggplot(Turkey_data, aes(x = Year, y = CO2)) + 
  geom_line() + 
  labs(x = "Year", y = expression(CO[2]), title = "Historic Carbon Emissions in Turkey" )


