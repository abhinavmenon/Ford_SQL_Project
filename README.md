Last login: Thu Dec 11 21:54:38 on ttys002
hashitaharies@MacBookPro ~ % sqlite3 ford_sql.db

SQLite version 3.51.0 2025-06-12 13:14:41
Enter ".help" for usage hints.
sqlite> CREATE TABLE customers (
(x1...>     customer_id INTEGER PRIMARY KEY,
(x1...>     name TEXT,
(x1...>     city TEXT
(x1...> );
sqlite> 
sqlite> CREATE TABLE orders (
(x1...>     order_id INTEGER PRIMARY KEY,
(x1...>     customer_id INTEGER,
(x1...>     order_date TEXT,
(x1...>     total_amount REAL
(x1...> );
sqlite> 
sqlite> CREATE TABLE order_items (
(x1...>     item_id INTEGER PRIMARY KEY,
(x1...>     order_id INTEGER,
(x1...>     part_name TEXT,
(x1...>     quantity INTEGER,
(x1...>     price REAL
(x1...> );
sqlite> 
sqlite> INSERT INTO customers VALUES
   ...> (1, 'Amit Verma', 'Delhi'),
   ...> (2, 'Sara Khan', 'Mumbai'),
   ...> (3, 'Ravi Narayan', 'Bangalore'),
   ...> (4, 'Priya Shah', 'Ahmedabad'),
   ...> (5, 'John Mathew', 'Kochi'),
   ...> (6, 'Nisha Patel', 'Pune'),
   ...> (7, 'Rohit Shetty', 'Chennai'),
   ...> (8, 'Ananya Singh', 'Hyderabad'),
   ...> (9, 'Vikas Kapoor', 'Jaipur'),
   ...> (10, 'Karan Mehta', 'Surat');
sqlite> 
sqlite> SELECT * FROM customers;
1|Amit Verma|Delhi
2|Sara Khan|Mumbai
3|Ravi Narayan|Bangalore
4|Priya Shah|Ahmedabad
5|John Mathew|Kochi
6|Nisha Patel|Pune
7|Rohit Shetty|Chennai
8|Ananya Singh|Hyderabad
9|Vikas Kapoor|Jaipur
10|Karan Mehta|Surat
sqlite> 
sqlite> INSERT INTO orders VALUES
   ...> (101, 1, '2025-01-05', 500),
   ...> (102, 1, '2025-01-12', 900),
   ...> (103, 2, '2025-01-15', 1200),
   ...> (104, 3, '2025-01-20', 750),
   ...> (105, 4, '2025-02-01', 1100),
   ...> (106, 5, '2025-02-05', 650),
   ...> (107, 6, '2025-02-10', 400),
   ...> (108, 7, '2025-02-12', 900),
   ...> (109, 8, '2025-02-18', 300),
   ...> (110, 9, '2025-03-01', 800),
   ...> (111, 10, '2025-03-05', 600),
   ...> (112, 3, '2025-03-10', 450),
   ...> (113, 2, '2025-03-15', 1200),
   ...> (114, 4, '2025-03-18', 550),
   ...> (115, 1, '2025-03-20', 700);
sqlite> 
sqlite> SELECT COUNT(*) FROM orders;
15
sqlite> 
sqlite> INSERT INTO order_items VALUES
   ...> (1, 101, 'Brake Pad', 2, 100),
   ...> (2, 101, 'Oil Filter', 1, 50),
   ...> (3, 102, 'Engine Belt', 1, 300),
   ...> (4, 102, 'Air Filter', 2, 150),
   ...> (5, 103, 'Battery', 1, 200),
   ...> (6, 103, 'Spark Plug', 4, 50),
   ...> (7, 104, 'Tire', 1, 750),
   ...> (8, 105, 'Brake Pad', 1, 100),
   ...> (9, 105, 'Oil Filter', 2, 100),
   ...> (10, 106, 'Spark Plug', 3, 50),
   ...> (11, 107, 'Brake Pad', 1, 100),
   ...> (12, 108, 'Air Filter', 1, 150),
   ...> (13, 109, 'Battery', 1, 200),
   ...> (14, 110, 'Engine Belt', 1, 300),
   ...> (15, 111, 'Brake Pad', 2, 100),
   ...> (16, 112, 'Spark Plug', 2, 50),
   ...> (17, 113, 'Tire', 1, 750),
   ...> (18, 114, 'Oil Filter', 1, 50),
   ...> (19, 115, 'Battery', 1, 200),
   ...> (20, 115, 'Air Filter', 1, 150),
   ...> (21, 113, 'Brake Pad', 1, 100),
   ...> (22, 108, 'Engine Belt', 1, 300),
   ...> (23, 103, 'Air Filter', 1, 150),
   ...> (24, 106, 'Brake Pad', 1, 100),
   ...> (25, 110, 'Spark Plug', 3, 50);
sqlite> 
sqlite> SELECT COUNT(*) FROM order_items;
25
sqlite> 
sqlite> SELECT COUNT(*) FROM order_items;
25
sqlite> .headers on
sqlite> .mode column
sqlite> 
sqlite> SELECT COUNT(*) AS total_customers FROM customers;
total_customers
---------------
10             
sqlite> SELECT SUM(total_amount) AS total_revenue FROM orders;
total_revenue
-------------
11000.0      
sqlite> SELECT ROUND(AVG(total_amount),2) AS avg_order_value FROM orders;
avg_order_value
---------------
733.33         
sqlite> SELECT c.customer_id, c.name,
   ...>        ROUND(SUM(o.total_amount),2) AS revenue
   ...> FROM customers c
   ...> JOIN orders o ON c.customer_id = o.customer_id
   ...> GROUP BY c.customer_id, c.name
   ...> ORDER BY revenue DESC;
customer_id  name          revenue
-----------  ------------  -------
2            Sara Khan     2400.0 
1            Amit Verma    2100.0 
4            Priya Shah    1650.0 
3            Ravi Narayan  1200.0 
7            Rohit Shetty  900.0  
9            Vikas Kapoor  800.0  
5            John Mathew   650.0  
10           Karan Mehta   600.0  
6            Nisha Patel   400.0  
8            Ananya Singh  300.0  
sqlite> SELECT substr(order_date,1,7) AS month,
   ...>        ROUND(SUM(total_amount),2) AS revenue
   ...> FROM orders
   ...> GROUP BY month
   ...> ORDER BY month;
month    revenue
-------  -------
2025-01  3350.0 
2025-02  3350.0 
2025-03  4300.0 
sqlite> SELECT part_name, SUM(quantity) AS units_sold
   ...> FROM order_items
   ...> GROUP BY part_name
   ...> ORDER BY units_sold DESC
   ...> LIMIT 1;
part_name   units_sold
----------  ----------
Spark Plug  12        
sqlite> SELECT c.name, COUNT(o.order_id) AS number_of_orders
   ...> FROM customers c
   ...> LEFT JOIN orders o ON c.customer_id = o.customer_id
   ...> GROUP BY c.name
   ...> ORDER BY number_of_orders DESC;
name          number_of_orders
------------  ----------------
Amit Verma    3               
Sara Khan     2               
Ravi Narayan  2               
Priya Shah    2               
Vikas Kapoor  1               
Rohit Shetty  1               
Nisha Patel   1               
Karan Mehta   1               
John Mathew   1               
Ananya Singh  1               
sqlite> SELECT o.order_id, c.name, o.order_date, o.total_amount
   ...> FROM orders o
   ...> JOIN customers c ON o.customer_id = c.customer_id
   ...> ORDER BY o.order_date;
order_id  name          order_date  total_amount
--------  ------------  ----------  ------------
101       Amit Verma    2025-01-05  500.0       
102       Amit Verma    2025-01-12  900.0       
103       Sara Khan     2025-01-15  1200.0      
104       Ravi Narayan  2025-01-20  750.0       
105       Priya Shah    2025-02-01  1100.0      
106       John Mathew   2025-02-05  650.0       
107       Nisha Patel   2025-02-10  400.0       
108       Rohit Shetty  2025-02-12  900.0       
109       Ananya Singh  2025-02-18  300.0       
110       Vikas Kapoor  2025-03-01  800.0       
111       Karan Mehta   2025-03-05  600.0       
112       Ravi Narayan  2025-03-10  450.0       
113       Sara Khan     2025-03-15  1200.0      
114       Priya Shah    2025-03-18  550.0       
115       Amit Verma    2025-03-20  700.0       
sqlite> SELECT order_id, SUM(quantity) AS total_items
   ...> FROM order_items
   ...> GROUP BY order_id
   ...> ORDER BY order_id;
order_id  total_items
--------  -----------
101       3          
102       3          
103       6          
104       1          
105       3          
106       4          
107       1          
108       2          
109       1          
110       4          
111       2          
112       2          
113       2          
114       1          
115       2          
sqlite> SELECT c.name, ROUND(SUM(o.total_amount),2) AS total_spent
   ...> FROM customers c
   ...> JOIN orders o ON c.customer_id = o.customer_id
   ...> GROUP BY c.name
   ...> ORDER BY total_spent DESC
   ...> LIMIT 1;
name       total_spent
---------  -----------
Sara Khan  2400.0     
sqlite> .quit
hashitaharies@MacBookPro ~ % sqlite3 -header -csv ford_sql.db "SELECT COUNT(*) AS total_customers FROM customers;" > outputs/q1_total_customers.csv
sqlite3 -header -csv ford_sql.db "SELECT SUM(total_amount) AS total_revenue FROM orders;" > outputs/q2_total_revenue.csv
# ...and so on for any query (replace SQL between quotes)

zsh: no such file or directory: outputs/q1_total_customers.csv
zsh: no such file or directory: outputs/q2_total_revenue.csv
zsh: missing end of string
hashitaharies@MacBookPro ~ % find ~ -name "ford_sql.db"

/Users/hashitaharies/ford_sql.db
find: /Users/hashitaharies/Library/Application Support/MobileSync: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/CallHistoryTransactions: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/CloudDocs: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/com.apple.sharedfilelist: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/Knowledge: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/com.apple.TCC: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/FileProvider: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/AddressBook: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/FaceTime: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/DifferentialPrivacy: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/com.apple.avfoundation/Frecents: Operation not permitted
find: /Users/hashitaharies/Library/Application Support/CallHistoryDB: Operation not permitted
find: /Users/hashitaharies/Library/Assistant/SiriVocabulary: Operation not permitted
find: /Users/hashitaharies/Library/Daemon Containers: Operation not permitted
find: /Users/hashitaharies/Library/Autosave Information: Operation not permitted
find: /Users/hashitaharies/Library/IdentityServices: Operation not permitted
find: /Users/hashitaharies/Library/Calendars: Operation not permitted
find: /Users/hashitaharies/Library/Messages: Operation not permitted
find: /Users/hashitaharies/Library/HomeKit: Operation not permitted
find: /Users/hashitaharies/Library/Sharing: Operation not permitted
find: /Users/hashitaharies/Library/com.apple.aiml.instrumentation: Operation not permitted
find: /Users/hashitaharies/Library/Mail: Operation not permitted
find: /Users/hashitaharies/Library/Trial: Operation not permitted
find: /Users/hashitaharies/Library/AppleMediaServices: Operation not permitted
find: /Users/hashitaharies/Library/DuetExpertCenter: Operation not permitted
find: /Users/hashitaharies/Library/Accounts: Operation not permitted
find: /Users/hashitaharies/Library/Safari: Operation not permitted
find: /Users/hashitaharies/Library/Biome: Operation not permitted
find: /Users/hashitaharies/Library/IntelligencePlatform: Operation not permitted
find: /Users/hashitaharies/Library/Shortcuts: Operation not permitted
cd /Users/hashitaharies

ls

find: /Users/hashitaharies/Library/Suggestions: Operation not permitted
find: /Users/hashitaharies/Library/Weather: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.stocks-news: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.photolibraryd.private: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.feedback: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.siri.inference: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.telephonyutilities.callservicesd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.swtransparency: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.coreservices.useractivityd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.ArchiveUtility.PKSignedContainer: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.accessibility.voicebanking: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.icloud.searchpartyuseragent: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.siri.referenceResolution: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.stocks: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.usernoted: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.VoiceMemos.shared: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.contacts: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.secure-control-center-preferences: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.chronod: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.MailPersonaStorage: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.private.translation: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.appstoreagent: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.portrait.BackgroundReplacement: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.icloud.fmfcore: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.liveactivitiesd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.amsondevicestoraged: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.SiriTTS: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.iBooks: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.notes.import: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.calendar: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.newsd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.ip.redirects: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.siri.userfeedbacklearning: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.gamecenter: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.tips: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.tv.sharedcontainer: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.loginwindow.persistent-apps: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.spotlight: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.studentd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.ManagedSettings: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.sharingd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.printtool: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.corerepair: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.news: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.mobileslideshow.PhotosFileProvider: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.scopedbookmarkagent: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.weather: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.systempreferences.cache: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.feedbacklogger: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.icloud.findmydevice.shared-configuration: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.controlcenter: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.siri.remembers: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.notes: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.stickersd.group: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.screencapture: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.UserNotifications: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.tipsnext: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.messages: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.moments: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.Safari.SandboxBroker: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.transparency: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.webkit.webpushd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.reminders: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.VoiceOver: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.findmy.findmylocateagent: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.mail: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.bird: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.DeviceActivity: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.replayd: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.Journal: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.Home.group: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.iCloudDrive: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.FaceTime: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.energykit: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.PreviewLegacySignaturesConversion: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.notesdebug: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.replicatord: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.Photos.PhotosFileProvider: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.icloud.fmipcore: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.AppleSpell: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.mlhost: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.FamilyControls: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.Maps: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.PegasusConfiguration: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/group.com.apple.shortcuts: Operation not permitted
find: /Users/hashitaharies/Library/Group Containers/com.apple.MessagesLegacyTransferArchive: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.VoiceMemos: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.archiveutility: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.Maps/Data/Maps: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.Home: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.Safari: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.CloudDocs.MobileDocumentsFileProvider: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.mail: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.MobileSMS: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.Notes: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.corerecents.recentsd/Data/Library/Recents: Operation not permitted
find: /Users/hashitaharies/Library/Containers/com.apple.stocks: Operation not permitted
find: /Users/hashitaharies/Library/ContainerManager: Operation not permitted
find: /Users/hashitaharies/Library/PersonalizationPortrait: Operation not permitted
find: /Users/hashitaharies/Library/Metadata/CoreSpotlight: Operation not permitted
find: /Users/hashitaharies/Library/Metadata/com.apple.IntelligentSuggestions: Operation not permitted
find: /Users/hashitaharies/Library/Reminders: Operation not permitted
find: /Users/hashitaharies/Library/Cookies: Operation not permitted
find: /Users/hashitaharies/Library/com.apple.bluetooth.services.cloud/CachedRecords/SoundProfileAsset: Operation not permitted
find: /Users/hashitaharies/Library/CoreFollowUp: Operation not permitted
find: /Users/hashitaharies/Library/StatusKit: Operation not permitted
find: /Users/hashitaharies/Library/DoNotDisturb: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.HomeKit: Operation not permitted
find: /Users/hashitaharies/Library/Caches/CloudKit: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.Safari: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.findmy.imagecache: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.findmy.fmfcore: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.containermanagerd: Operation not permitted
find: /Users/hashitaharies/Library/Caches/FamilyCircle: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.homed: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.findmy.fmipcore: Operation not permitted
find: /Users/hashitaharies/Library/Caches/com.apple.ap.adprivacyd: Operation not permitted
find: /Users/hashitaharies/.Trash: Operation not permitted
hashitaharies@MacBookPro ~ % cd /Users/hashitaharies
hashitaharies@MacBookPro ~ % 
hashitaharies@MacBookPro ~ % ls
<!DOCTYPE html>.cs		Applications (Parallels)	Downloads			Music				Public				my_database.db
AnyToResource			Desktop				Library				Parallels			X-Plane 12
Applications			Documents			Movies				Pictures			ford_sql.db
hashitaharies@MacBookPro ~ % 
hashitaharies@MacBookPro ~ % mkdir outputs

hashitaharies@MacBookPro ~ % ls

<!DOCTYPE html>.cs		Music
AnyToResource			Parallels
Applications			Pictures
Applications (Parallels)	Public
Desktop				X-Plane 12
Documents			ford_sql.db
Downloads			my_database.db
Library				outputs
Movies
hashitaharies@MacBookPro ~ % sqlite3 -header -csv ford_sql.db "SELECT COUNT(*) AS total_customers FROM customers;" > outputs/q1_total_customers.csv

hashitaharies@MacBookPro ~ % sqlite3 -header -csv ford_sql.db "SELECT SUM(total_amount) AS total_revenue FROM orders;" > outputs/q2_total_revenue.csv

hashitaharies@MacBookPro ~ % ls outputs

q1_total_customers.csv	q2_total_revenue.csv
hashitaharies@MacBookPro ~ % mkdir ~/Ford_SQL_Project

hashitaharies@MacBookPro ~ % cd ~/Ford_SQL_Project

hashitaharies@MacBookPro Ford_SQL_Project % mv ~/ford_sql.db ~/Ford_SQL_Project/ 

hashitaharies@MacBookPro Ford_SQL_Project % ls

ford_sql.db
hashitaharies@MacBookPro Ford_SQL_Project % nano README.md


  UW PICO 5.09                    File: README.md                     Modified  

- **Top-selling part:** *Brake Pad*
- **Highest revenue month:** March 2025
- **Most active cities:** Delhi, Mumbai, Bangalore

These insights demonstrate how basic SQL queries can extract business intellige$
   
---

## Contact
$In or email.





   
   



^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
