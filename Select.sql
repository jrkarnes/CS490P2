-- Select Names of all Authors who wrote books published
-- in 2002

SELECT * FROM AUTHOR
INNER JOIN AUTHORSHIP ON AUTHOR.ID = AUTHORSHIP.AUTHOR_ID
INNER JOIN BOOK ON BOOK.ISBN = AUTHORSHIP.BOOK_ID
WHERE BOOK.YEARISSUED = 2002
GROUP BY AUTHOR.NAME;

-- Return the number of copies for each book
-- Order doesn't matter

SELECT COUNT(*) AS "Number of Copies"
FROM COPY
INNER JOIN BOOK ON COPY.COPYID = BOOK.ISBN
GROUP BY BOOK.ISBN

-- Return information about the copies that have been borrowed
-- between the years 2010 and 2012.

SELECT * FROM LOAN
INNER JOIN COPY ON COPY.BARCODE = LOAN.COPY_ID
INNER JOIN BOOK ON COPY.BOOK_ID = BOOK.ISBN
WHERE DATE_FORMAT 2010 <= (LOAN.BORROWDATE, %Y) <= 2012
GROUP BY COPY.COPY_ID

-- Return information about the members who haven't returned
-- the books they borrowed yet.

SELECT * FROM LOAN
INNER JOIN MEMBER ON MEMBER.ID = LOAN.MEMBERID
WHERE LOAN.STATUS = 1