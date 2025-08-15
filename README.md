# 🎥 Netflix Show Recommender

## 📌 Overview
This project builds a **content-based recommendation system** for Netflix movies and TV shows.  
It uses **cosine similarity** on genres and descriptions to recommend similar titles.

## 🎯 Goal
- Recommend Netflix titles similar to a given show or movie.
- Explore text-based recommendation using genres and descriptions.

## 📂 Dataset
- **Source:** [Netflix Shows Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Columns used:**
  - `title`
  - `listed_in` (Genres)
  - `description`

## 🛠 Features
- Cleans and preprocesses text (lowercasing, removing numbers/punctuation, etc.)
- Combines genre and description for recommendation.
- Creates a term-document matrix for similarity calculation.
- Uses **cosine similarity** to find similar shows.
- Allows flexible number of recommendations.

## 📦 Requirements
- **R >= 4.0**
- Packages:
```r
install.packages(c("tidyverse", "readr", "stringr", "textclean", "tm", "proxy"))
```

## 🚀 How to Run
1. Download the dataset `netflix_titles.csv` from Kaggle and place it in your working directory.
2. Run the R script:
```r
source("netflix_recommender.R")
```
3. Try the recommender:
```r
recommend_titles("Breaking Bad", 5)
```

## 📊 Example Output
```
📺 Recommendations for: Breaking Bad
[1] "Narcos" "El Chapo" "Better Call Saul" "Ozark" "The Blacklist"
```

## 📌 Skills Used
- **Recommender Systems**
- **Text Mining**
- **Natural Language Processing**
- **Cosine Similarity**
