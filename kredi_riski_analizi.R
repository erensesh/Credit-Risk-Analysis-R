## KREDİ RİSKİ ANALİZİ
## Kaggle - UCI Credit Card Default Dataset
############################################################

## Gerekli paketler
packages <- c("data.table", "caret", "rpart", "rpart.plot", "e1071", "pROC")

for (p in packages) {
  if (!require(p, character.only = TRUE)) {
    install.packages(p, dependencies = TRUE)
    library(p, character.only = TRUE)
  }
}

set.seed(123)

############################################################
## Veri Setinin Yüklenmesi
############################################################

# Çalışma dizini (proje klasörü)
setwd("C:/Users/Administrator/Desktop/eren proje 1")

# CSV dosyasını oku (GERÇEK DOSYA ADI)
data <- fread("UCI_Credit_Card.csv.csv")

# Kontroller
dim(data)
head(data)

############################################################
## Veri Ön İşleme
############################################################

# ID sütununu kaldır (ilk sütun)
data <- data[, -1]

# Hedef değişkeni faktöre çevir
data$default.payment.next.month <- as.factor(data$default.payment.next.month)

# Hedef değişken dağılımı
table(data$default.payment.next.month)

############################################################
## Eğitim / Test Ayrımı
############################################################

index <- createDataPartition(
  data$default.payment.next.month,
  p = 0.70,
  list = FALSE
)

train_data <- data[index, ]
test_data  <- data[-index, ]

############################################################
## Model 1: Karar Ağacı
############################################################

dt_model <- rpart(
  default.payment.next.month ~ .,
  data = train_data,
  method = "class"
)

# Karar ağacını çiz
rpart.plot(dt_model)

# Tahmin
dt_pred <- predict(dt_model, test_data, type = "class")

# Performans
confusionMatrix(
  dt_pred,
  test_data$default.payment.next.month
)

############################################################
## Model 2: Naive Bayes
############################################################

nb_model <- naiveBayes(
  default.payment.next.month ~ .,
  data = train_data
)

nb_pred <- predict(nb_model, test_data)

confusionMatrix(
  nb_pred,
  test_data$default.payment.next.month
)

############################################################
## ROC ve AUC (Karar Ağacı)
############################################################

dt_prob <- predict(dt_model, test_data, type = "prob")[, 2]

roc_dt <- roc(
  as.numeric(as.character(test_data$default.payment.next.month)),
  dt_prob
)

auc(roc_dt)
plot(roc_dt, main = "Karar Agaci ROC Egrisi")