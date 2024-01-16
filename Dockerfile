# Use an official R image
FROM rocker/tidyverse:latest

# Install required R packages
RUN R -e "install.packages(c('shiny', 'learnr', 'rmarkdown', 'klassR'), repos='http://cran.rstudio.com/')"

RUN mkdir -p /home/dapla

# Copy your R Markdown files into the Docker image
COPY ./klassR_tutorial.Rmd /home/dapla

# Set the working directory
WORKDIR /home/dapla

# Expose the port Shiny runs on
EXPOSE 3838

# Run the tutorial as a Shiny app
CMD ["R", "-e", "rmarkdown::run('/home/dapla/klassR_tutorial.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"]
