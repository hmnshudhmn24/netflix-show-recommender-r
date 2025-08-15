# 🎥 Netflix Show Recommender
# Author: Your Name
# Date: 2025-08-14

# 📦 Install & Load Required Packages
packages <- c("tidyverse", "readr", "stringr", "textclean", "tm", "proxy")
installed_packages <- rownames(installed.packages())
for (p in packages) {
  if (!(p %in% installed_packages)) install.packages(p)
}
lapply(packages, library, character.only = TRUE)

# 📂 Load Dataset
# Download from: https://www.kaggle.com/datasets/shivamb/netflix-shows
netflix <- read_csv("netflix_titles.csv")

# 🧹 Data Cleaning
netflix <- netflix %>%
  mutate(
    description = replace_na(description, ""),
    listed_in = replace_na(listed_in, ""),
    combined_text = paste(listed_in, description, sep = " ")
  )

# 🧽 Text Preprocessing
clean_text <- function(text) {
  text %>%
    tolower() %>%
    replace_contraction() %>%
    replace_number(remove = TRUE) %>%
    replace_symbol() %>%
    str_replace_all("[[:punct:]]", " ") %>%
    str_squish()
}

netflix$clean_text <- sapply(netflix$combined_text, clean_text)

# 📊 Create Term-Document Matrix
corpus <- VCorpus(VectorSource(netflix$clean_text))
tdm <- TermDocumentMatrix(corpus, control = list(stopwords = TRUE))
tdm_matrix <- as.matrix(tdm)

# 🔍 Compute Cosine Similarity
similarity_matrix <- proxy::simil(t(tdm_matrix), method = "cosine")

# 🎯 Recommendation Function
recommend_titles <- function(title, num_recommendations = 5) {
  title_index <- which(netflix$title == title)
  
  if (length(title_index) == 0) {
    cat("❌ Title not found in the dataset.\n")
    return(NULL)
  }
  
  scores <- similarity_matrix[title_index, ]
  scores <- sort(scores, decreasing = TRUE)
  
  recommended_indices <- setdiff(names(scores)[1:(num_recommendations + 1)], as.character(title_index))
  
  recommendations <- netflix$title[as.numeric(recommended_indices)]
  return(recommendations)
}

# 🧪 Example Usage
example_title <- "Breaking Bad"
cat("📺 Recommendations for:", example_title, "\n")
print(recommend_titles(example_title, 5))
