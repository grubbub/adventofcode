library(readxl)
library(dplyr)

df <- read_excel("/Users/loganthomas/development/adventofcode/day1/Book1.xlsx", sheet = 1, col_names = FALSE)
print(colnames(df))
df <- df %>%
  rename("your_column" = "...1")


# Sample data frame
# df <- data.frame(your_column = c("abc123", "456def", "789ghi","1ounvoeiun"))



# Remove non-numeric characters from the string column
df$numerics <- gsub("[^0-9]", "", df$your_column)
df$first_character <- substr(df$numerics, 1, 1)
df$last_character <- substr(df$numerics, nchar(df$numerics), nchar(df$numerics))

# Combine the first and last characters into one number
df$combined_number <- as.numeric(paste0(df$first_character, df$last_character))

# Calculate the sum of the combined_number column
total_sum <- sum(df$combined_number)

# Print the total sum
print(total_sum)
