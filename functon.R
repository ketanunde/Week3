# Function needed to allow us to input number, or set of numbers.
# Function should calculate the percentage value for each number


add_percent <- function(my_number) 
  {
      # Multiply the number by 100 and only show 1 digit
      # Round command is used for round-up the single digit
      percent <- round(my_number * 100, digits = 1)
      result <- paste(percent, "%", sep = "")
      
      # Return the calculation
      return(result)
}

# Test the Function
sample_vector <- c(0.463, 1.463, 233.64)
add_percent(sample_vector)


# Adding another argument in function that will used as formula multiplier
# Add another argument that wil control the number of digits

add_percent <- function(my_number, multiplier, no_digits) 
{
  # Multiply the number by multiplier and only show digits
  # Round command is used for round-up the single digit
  percent <- round(my_number * multiplier, digits = no_digits)
  result <- paste(percent, "%", sep = "")
  
  # Return the calculation
  return(result)
}

# Test Function
# it takes number from sample vector and multiply by 2 and then disply the 3 digits

my_result <- add_percent(sample_vector, 2, 3)
my_result



my_stats <- function(values, parametric = TRUE, allow_print = FALSE)
{
    if (parametric) 
    {
      central_tendency <- mean(values)
      spread <- sd(values)
    }
    else
    {
      central_tendency <- median(values)
      spread <- mad(values)
    }
  if (allow_print == TRUE & parametric == TRUE) 
  {
    # construct relevent output
    cat("Mean = ", central_tendency, "\n", "SD = ", spread, "\n")
  }
  else if (allow_print &  !parametric) 
  {
    cat("Median = ", central_tendency, "\n", "MAD = ", spread, "\n")
  }
}

result <- my_stats(sample_vector, FALSE, TRUE)

