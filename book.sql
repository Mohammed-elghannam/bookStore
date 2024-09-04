CREATE TABLE IF NOT EXISTS book (
    ISBN VARCHAR(20) PRIMARY KEY,
    pub_date DATETIME,
    descr VARCHAR(100),
    genre VARCHAR(40),
    title VARCHAR(40),
    price INT,
    stock INT,
    author VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS Reviews (
    rev_id VARCHAR(20) PRIMARY KEY,
    review_date DATETIME,
    review_text VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS book_review (
    rev_id VARCHAR(20) PRIMARY KEY,
    ISBN VARCHAR(20),
    FOREIGN KEY (rev_id)
        REFERENCES Reviews (rev_id),
    FOREIGN KEY (ISBN)
        REFERENCES book (ISBN)
);
    
CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(20) PRIMARY KEY,
    status VARCHAR(20),
    total_price INT
);

CREATE TABLE IF NOT EXISTS customer (
    cust_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(30),
    address VARCHAR(150)
);


CREATE TABLE IF NOT EXISTS cust_rev (
    rev_id VARCHAR(20) PRIMARY KEY,
    cust_id VARCHAR(20),
    FOREIGN KEY (rev_id)
        REFERENCES Reviews (rev_id),
    FOREIGN KEY (cust_id)
        REFERENCES customer (cust_id)
);
create table if not exists employee(
	emp_id varchar(20) primary key,
    name varchar(50),
    email varchar(100),
    phone_num varchar(30),
    job_title varchar(100),
    hire_date DATE
    );

create table if not exists emp_ord(
	order_id varchar(20) primary key,
    emp_id varchar(20),
    foreign key(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id)
    );
    
    
alter table book
add order_id varchar(20),
ADD CONSTRAINT fk_book_orders
foreign key (order_id) references orders(order_id);

alter table orders 
add cust_id varchar(20),
add constraint fk_orders_cust
FOREIGN KEY(cust_id) REFERENCES customer(cust_id);
                                 

