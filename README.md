#### Project done by Harsh Mehta , hhm5044@psu.edu

@Test1: 1, 1000, 6327000
@Test2: 2, 1000, 9451000
@Test3: 4, 1000, 15871000
@Test4: 8, 1000, 23871000
@Test5: 16, 1000, 30745000
@Test6: 32, 1000, 33230000
@Test7: 2, 10000, 9222000
@Test8: 8, 10000, 23819000
@Test9: 8, 100, 23845000

When the buffer is set to 1000 bytes, the efficiency of the number of threads and the time taken is the least. The time taken for all of the threads are directly proportional to the number of threads according to the results, which is most likely caused due to context switching overhead resulting in an increased running time. With a single thread, the program is serialized so it takes a comparatively higher amount of time. A significant observation can be made in the 8 thread range, there is very insignificant change in time when the number of threads (8) are constant. The change in the buffer size does not equal to an increase in the running time due to a similar pace of consumption in the input and output. As a result even lower buffer sizes stay relatively free and it can be concluded that lower buffer sizes like 100 are also efficient.

## Academic Integrity Statement
Please note that all work included in this project is the original work of the author, and any external sources or references have been properly cited and credited. It is strictly prohibited to copy, reproduce, or use any part of this work without proper attribution and permission from the author.

If you choose to use any part of this work as a reference or resource, you are responsible for ensuring that you do not plagiarize or violate any academic integrity policies or guidelines. The author of this work cannot be held liable for any legal or academic consequences resulting from the misuse or misappropriation of this work.

In summary, any unauthorized copying or use of this work may result in serious consequences, including but not limited to academic penalties, legal action, and damage to personal and professional reputation. Therefore, please use this work only as a reference and always ensure that you properly cite and attribute any sources or references used.