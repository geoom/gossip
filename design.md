# Gossip design

## use cases and constraint

### Use cases

#### scope for handling only the following use cases

* **User** posts an article
    * **Service** pushes posts to followers, sending push notifications and emails
* **User** can follow another users.
* **User** views the user's articles board
* **User** searches for articles
* **Service** has high availability

#### Out of scope

* **Service** strips out posts based on user's visibility settings
* Analytics

### Constraints and assumptions

#### State assumptions

General

* Traffic is not evenly distributed
* Posting a post should be fast
    * spreading out a article to all of your followers should be fast, unless you have millions of followers
* 100 million active users
* 500 million articles per day or 15 billion articles per month
    * Each article averages a fanout of 10 deliveries
    * 5 billion total articles delivered on fanout per day (150 billion per month)
* 250 billion read requests per month
* 10 billion searches per month

Article board

* Viewing the article board should be fast
* Gossip is more read heavy than write heavy
    * Optimize for fast reads of articles
* Ingesting articles is write heavy

Search

* Searching should be fast
* Search is read-heavy


#### Usage aproximation

* Size per article:
    * `article_id` - 8 bytes
    * `user_id` - 32 bytes
    * `title` - 100 bytes
    * `content` - 15 KB average
    * Total: ~15 KB
* 225 TB of new article content per month
    * 15 KB per article * 500 million articles per day * 30 days per month
    * 8.1 PB of new article content in 3 years
* 100 thousand read requests per second
    * 250 billion read requests per month * (400 requests per second / 1 billion requests per month)
* 6,000 articles per second
    * 15 billion articles per month * (400 requests per second / 1 billion requests per month)
* 60 thousand articles delivered on fanout per second
    * 150 billion articles delivered on fanout per month * (400 requests per second / 1 billion requests per month)
* 4,000 search requests per second

Useful conversion guide:

* 2.5 million seconds per month
* 1 request per second = 2.5 million requests per month
* 40 requests per second = 100 million requests per month
* 400 requests per second = 1 billion requests per month


## High level design

> Just important components has shown in this diagram.

![Imgur](https://i.imgur.com/7DAvTLJ.png)
