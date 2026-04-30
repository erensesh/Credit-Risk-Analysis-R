Kredi Kartı Temerrüt Riski Analizi (R)

Bu proje, Kaggle'daki **UCI Credit Card** veri seti kullanılarak müşterilerin kredi kartı borçlarını ödeyip ödemeyeceklerini tahmin etmek amacıyla hazırlanmıştır.

## 🚀 Proje Amacı
30.000 müşterinin demografik verileri ve geçmiş ödeme alışkanlıkları analiz edilerek, bir sonraki ay "temerrüt" (borcun ödenmemesi) riskini sınıflandırma modelleriyle önceden tespit etmek.

## 🛠️ Kullanılan Teknolojiler
* **Dil:** R
* **Veri Yönetimi:** `data.table`, `caret`
* **Modelleme:** `rpart` (Karar Ağaçları), `e1071` (Naive Bayes)
* **Performans Analizi:** `pROC` (AUC ve ROC Eğrileri)

## 📊 Uygulanan Adımlar
1. **Veri Ön İşleme:** Gereksiz ID sütunlarının kaldırılması ve hedef değişkenin (default.payment) analiz için hazırlanması.
2. **Model Eğitimi:** Veri setinin %70'i ile modeller eğitildi.
3. **Analiz:** Karar Ağacı görselleştirildi ve modelin doğruluk oranları karşılaştırıldı.
4. **Değerlendirme:** ROC eğrisi ve AUC değeri ile modelin güvenilirliği test edildi.
