# Project 1: North Dakota Crop Yield Analysis

# North Dakota Corn and Soybean Yield Analysis
# Data source: USDA NASS Quick Stats
# Study period: 2000-2025

# Step 1: Import datasets
corn <- read.csv("data/ND_Corn_Yield_2000_2025.csv")
soybean <- read.csv("data/ND_Soybean_Yield_2000_2025.csv")

# Step 2: Check datasets
head(corn)
head(soybean)

# Check dimensions
dim(corn)
dim(soybean)


# Show all imported objects
ls()

# Give our imported datasets shorter names

corn <- ND_Corn_Yield_2000_2025
soybean <- ND_Soybean_Yield_2000_2025

# Check the first six rows
head (corn)
head(soybean)

# Check column names
names(corn)
names(soybean)

# Check number of rows and columns
dim(corn)
dim(soybean

 # Step 5: Select relevant columns
    
corn_clean <- corn[, c("Year", "Commodity", "Value")]
soybean_clean <- soybean[, c("Year", "Commodity", "Value")]
    
# View cleaned datasets
head(corn_clean)
head(soybean_clean)

# Combine both datasets into one

crop_yield <- rbind(corn_clean, soybean_clean)

# Check combined dataset
dim(crop_yield)

# View first six rows
head(crop_yield)

# Count observations for each crop
table(crop_yield$Commodity)

# Count missing values in each column
colSums(is.na(crop_yield))

# Check data types
str(crop_yield)
dim(crop_yield)
colSums(is.na(crop_yield))
str(crop_yield)
 

# Step 6: Visualize crop yield trends

# Separate the two crops
corn_data <- subset(crop_yield, Commodity == "CORN")
soybean_data <- subset(crop_yield, Commodity == "SOYBEANS")

# Arrange observations by year
corn_data <- corn_data[order(corn_data$Year), ]
soybean_data <- soybean_data[order(soybean_data$Year), ]

# Create two graphs
par(mfrow = c(2, 1))

corn_data <- subset(crop_yield, Commodity == "CORN")
head(corn_data)

soybean_data <- subset(crop_yield, Commodity == "SOYBEANS")
head(soybean_data)


# Arrange corn observations by year
corn_data <- corn_data[order(corn_data$Year), ]

# Plot corn yield
plot(corn_data$Year, corn_data$Value,
     type = "b",
     col = "darkgreen",
     pch = 19,
     main = "North Dakota Corn Yield (2000-2025)",
     xlab = "Year",
     ylab = "Yield (bu/acre)")


# Extract soybean data
soybean_data <- subset(crop_yield, Commodity == "SOYBEANS")

# Arrange years from oldest to newest
soybean_data <- soybean_data[order(soybean_data$Year), ]

# Create soybean yield graph
plot(soybean_data$Year, soybean_data$Value,
     type = "b",
     col = "darkblue",
     pch = 19,
     main = "North Dakota Soybean Yield (2000-2025)",
     xlab = "Year",
     ylab = "Yield (bu/acre)")


# Step 8: Descriptive statistics

# Corn
mean(corn_data$Value)
min(corn_data$Value)
max(corn_data$Value)

# Soybeans
mean(soybean_data$Value)
min(soybean_data$Value)
max(soybean_data$Value)

# Years with highest and lowest corn yields
corn_data[which.max(corn_data$Value), ]
corn_data[which.min(corn_data$Value), ]

# Years with highest and lowest soybean yields
soybean_data[which.max(soybean_data$Value), ]
soybean_data[which.min(soybean_data$Value), ]

# Step 9: Linear regression analysis

# Corn yield trend
corn_model <- lm(Value ~ Year, data = corn_data)

# Soybean yield trend
soybean_model <- lm(Value ~ Year, data = soybean_data)

# View regression results
summary(corn_model)
summary(soybean_model)

# Corn yield with linear trend
corn_data <- corn_data[order(corn_data$Year), ]

plot(corn_data$Year, corn_data$Value,
     type = "b",
     col = "darkgreen",
     pch = 19,
     main = "Corn Yield Trend in North Dakota",
     xlab = "Year",
     ylab = "Yield (bu/acre)")

abline(corn_model, col = "red", lwd = 2)


# Soybean yield with linear trend
soybean_data <- soybean_data[order(soybean_data$Year), ]

plot(soybean_data$Year, soybean_data$Value,
     type = "b",
     col = "darkblue",
     pch = 19,
     main = "Soybean Yield Trend in North Dakota",
     xlab = "Year",
     ylab = "Yield (bu/acre)")

abline(soybean_model, col = "red", lwd = 2)

