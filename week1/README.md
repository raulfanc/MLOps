
#### running Jupyter Notebook on VM, access from local
- restart or create a GCP VM with terraform (Ubuntu (x86 intel architecture))
- using ssh for the VM's `Metadata` --> `SSH`
```bash
cd ./ssh/gcp.pub
```
- install anacoda on VM
- ssh access to vm 
- modify ssh's config file for easier SSH access
```bash
nano cd ./ssh/config
```
then change the hostname to the VM's external ip address (this address gets changed everytime restarting the VM, to get static ip need to pay extra)
- ssh to vm with `port mapping to 8888` (for jupyter)
```bash
ssh -i ~/.ssh/gcp -L 8888:localhost:8888 <vm username>@<vm external ip address>
```
- run jupyter notebook on that gcp vm
```
jupyter notebook .
```

### Terraform used 
we can use terraform to fastly provision a GCP VM, refer to [main.tf](main.tf) and [variables.tf](variables.tf)

### OH Encoding
refer to [OneHotEncoding.md](OneHotEncoding.md)

---

### Skit-learn Vectorizer
Before feeding your data to the `DictVectorizer` for one-hot encoding (OHE), there are a few things you should remember:

1.  **Handle Missing Values:** Ensure that the data doesn't contain missing values. `DictVectorizer` will not handle NaN values and this will cause errors. For categorical features, you might want to fill in missing values with a value like "Missing" or the most common category. For numerical features, you might want to fill in missing values with a value like the mean or median of that feature.
    
2.  **Avoid High Cardinality in Categorical Features:** Categorical variables with a large number of unique categories (high cardinality) can lead to a very large output matrix when one-hot encoded. You may need to group less common categories under an "other" category, or only use the most common categories for your encoding.
    
3.  **Avoid Leakage:** Be aware of data leakage - don't include any features in your model that include information about the target variable. This can lead to overly optimistic model performance on training data, but poor performance on unseen data.
    
4.  **Train-Validation Consistency:** Remember to use `fit_transform()` on the training data and `transform()` on the validation/test data. The validation/test data should be transformed in the same way as the training data, to ensure consistency.
    
5.  **Consider Feature Scaling:** If you're using a model that is sensitive to the scale of the features (like linear regression, SVM, or neural networks), consider scaling your numerical features. However, this isn't necessary for tree-based models like decision trees and random forests.
    
6.  **Understand the Input Data Type:** `DictVectorizer` expects a list of dictionaries as input where the keys are feature names and the values are feature values. When you use the `to_dict(orient='records')` function from pandas, it will transform each row of the DataFrame into a dictionary, which you can feed into `DictVectorizer`. The column names will be the keys and the row values will be the values.

