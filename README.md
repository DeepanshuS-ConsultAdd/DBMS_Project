SQL 

Question
![PHOTO-2024-07-09-11-23-30](https://github.com/DeepanshuS-ConsultAdd/DBMS_Project/assets/174502313/b6a24aea-4613-4467-a3de-336b459c9c58)

This SQL script aims to generate weak labels for images by evaluating their scores. It starts by creating two subqueries: `sub_table1` and `sub_table2`. `sub_table1` includes images with scores less than 0.5, while `sub_table2` includes those with scores greater than 0.5. For each subquery, images are ordered by their scores in descending order and assigned a row number (`rn`).

The main part of the query then selects images from both subqueries. It chooses images from `sub_table1` and `sub_table2` where the row number is 30,000 or less and `rn % 3 = 1`. This ensures that only specific images are selected. The score of each selected image is rounded to create a weak label. Finally, the results from both subqueries are combined using a `UNION` operation, providing a final list of image IDs and their corresponding weak labels.

Solution
<img width="841" alt="Screenshot 2024-07-09 at 11 32 00 AM" src="https://github.com/DeepanshuS-ConsultAdd/DBMS_Project/assets/174502313/087edcc1-edb4-4c08-8060-315685d5efcb">

ER-Model

Question
![image](https://github.com/DeepanshuS-ConsultAdd/DBMS_Project/assets/174502313/fb2f1064-0fb1-4369-9a00-7278354e59d4)

Model
<img width="753" alt="Screenshot 2024-07-09 at 11 29 50 AM" src="https://github.com/DeepanshuS-ConsultAdd/DBMS_Project/assets/174502313/50a9bce3-2297-4bf4-9c80-aeac8750ce97">

Table
<img width="1201" alt="image" src="https://github.com/DeepanshuS-ConsultAdd/DBMS_Project/assets/174502313/9eea5e0d-c93d-40a5-9cfb-c902d6e587f8">

