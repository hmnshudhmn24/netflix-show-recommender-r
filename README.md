# 🎥 Netflix Show Recommender  

## 📌 Overview  

The **Netflix Show Recommender** is a **content-based recommendation system** built in **R**.  
It recommends Netflix movies and TV shows that are **similar to a given title** by analyzing:  

- **Genres (`listed_in`)**  
- **Description (`description`)**  

The system uses **cosine similarity** on a combined text representation (genres + descriptions) to recommend the most similar titles.  



## 🎯 Goals  

- 📺 Suggest shows/movies similar to a given Netflix title.  
- 🔍 Explore how **text-based similarity** can be used for recommendations.  
- 🛠 Build an **explainable, lightweight recommendation system** using R.  



## 📂 Dataset  

- **Source:** [Netflix Shows Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)  
- **File:** `netflix_titles.csv`  
- **Columns used:**  
  - `title` → Movie/TV show name  
  - `listed_in` → Genres  
  - `description` → Short plot/summary  



## 🛠 Features  

- ✅ **Data cleaning**: lowercasing, removing punctuation, numbers, and stopwords.  
- ✅ **Text preprocessing**: combining `listed_in` (genres) + `description`.  
- ✅ **Term-document matrix** for vectorization.  
- ✅ **Cosine similarity** to measure how close two titles are.  
- ✅ **Customizable recommendations**: user can specify how many recommendations to fetch.  



## 📦 Requirements  

- **R version ≥ 4.0**  
- Required packages:  

```r
install.packages(c("tidyverse", "readr", "stringr", "textclean", "tm", "proxy"))
```



## 🚀 How to Run  

1. Download dataset from Kaggle → [Netflix Shows Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows).  
2. Place the dataset (`netflix_titles.csv`) in your working directory.  
3. Run the script:  

```r
source("netflix_recommender.R")
```  

4. Get recommendations:  

```r
recommend_titles("Breaking Bad", 5)
```  



## 📊 Example Output  

```
📺 Recommendations for: Breaking Bad
[1] "Narcos" "El Chapo" "Better Call Saul" "Ozark" "The Blacklist"
```



## 📌 Skills Used  

- 🎯 **Recommender Systems**  
- 📖 **Text Mining & NLP**  
- 📊 **Cosine Similarity**  
- 🧹 **Data Cleaning & Preprocessing**  
- 🛠 **R Programming**  



## 🚀 Roadmap  

- [ ] Add TF-IDF weighting for improved similarity.  
- [ ] Add hybrid recommendations (text + popularity).  
- [ ] Build a simple **Shiny app** for interactive recommendations.  
- [ ] Deploy as an **API** for integration.  


