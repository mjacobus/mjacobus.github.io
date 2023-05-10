---
layout: post
title: Reminders about indexes
tags: [Databases]
comments: true
---

Some thoughts

- Bitmap index scan - Uses index
- Bitmap hash scan - No index
- Indexes are sorted lists
- PG (and maybe other DBMS) has the concept of pages
    - A page is a ~8k "thing" that contain:
        - Page number
        - Tuples - (Page number, record id) - identifiers for each row
        - Some other metadata
- Partial index are indexes created like `CREATE INDEX foo_bar WHERE active = TRUE`
- More than B-Trees
    - Hash Table - for `==` comparisons
    - GIN: Generated inverse index 
        - Full text search
        - Tsvector
    - BRIN: Block range index
        - min/max
        - Tiny storage needs
- Indexes be added, mainly for:
    - Filter/sort
    - Rebalance tree
    - Not free. More memory consumption and time to write
    - Can find candidates by doing `EXPLAIN ANALYZE sql`
- Indexes are basically key/value stores
    - Values: row values
    - Value: sorted list (Page, ItemId) - that is a tuple
    - B+Trees are b-trees where leafs have a link to the next leaf
- Indexes pre-calculate stuff
- Listing indexes in PG `SELECT * FROM pg_indexes WHERE tablename = 'my_table' ;`
- Sizes: `SELECT pg_table_size('my_index_name') ;`

-------

Sources:

- https://www.youtube.com/watch?v=clrtT_4WBAw&ab_channel=PyConAU
- https://www.vultr.com/docs/introduction-to-using-indexes-in-postgresql/?utm_source=performance-max-latam&utm_medium=paidmedia&obility_id=17096555207&utm_adgroup=&utm_campaign=&utm_term=&utm_content=&gclid=CjwKCAjwge2iBhBBEiwAfXDBR6l4_6ijSBUpPtGXBB6yFPINF5ZXml4HLcNYUJxngzI8Z-o5YAcw4hoCmSEQAvD_BwE
