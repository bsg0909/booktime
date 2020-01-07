-- ���
CREATE TABLE "USER" (
	userid           varchar2(30)  NOT NULL, -- ���̵�
	pwd              varchar2(60)  NOT NULL, -- ��й�ȣ
	name             varchar2(30)  NOT NULL, -- �̸�
	birth            varchar2(30)  NOT NULL, -- �������
	gender           varchar2(10)  NOT NULL, -- ����
	grade            varchar2(20)  NOT NULL, -- ���
	email1           varchar2(100) NOT NULL, -- �̸���1
	email2           varchar2(100) NOT NULL, -- �̸���2
	emailAgree       char(3)       NULL,     -- ���ϼ��ŵ���
	zipcode          varchar2(20)  NOT NULL, -- ������ȣ
	parselAddress    varchar2(300) NOT NULL, -- �����ּ�
	newAddress       varchar2(300) NOT NULL, -- ���θ��ּ�
	addressDetail    varchar2(300) NOT NULL, -- ���ּ�
	phone            varchar2(30)  NULL,     -- ��ȭ��ȣ
	mileage          number        NULL,     -- ���ϸ���
	withdrawalDate   date          NULL,     -- Ż����
	withdrawalReason date          NULL      -- Ż�����
);

--drop sequence user_seq;
create sequence user_seq
increment by 1
start with 1
nocache;

-- ��� �⺻Ű
CREATE UNIQUE INDEX PK_USER
	ON "USER" ( -- ���
		userid ASC -- ���̵�
	);

-- ���
ALTER TABLE "USER"
	ADD
		CONSTRAINT PK_USER -- ��� �⺻Ű
		PRIMARY KEY (
			userid -- ���̵�
		);

-- �Խ���
CREATE TABLE BOARD (
	boardNo          number        NOT NULL, -- �Խñ۹�ȣ
	userid           varchar2(30)  NULL,     -- ���̵�
	category         varchar2(30)  NOT NULL, -- ī�װ���
	title            varchar2(60)  NOT NULL, -- ����
	content          CLOB          NULL,     -- ����
	regdate          date          NULL,     -- �ۼ���
	filename         varchar2(600) NULL,     -- �����̸�
	originalFilename varchar2(600) NULL,     -- ���� ���� �̸�
	filesize         number        NULL,     -- ����ũ��
	deleteDate       date          NULL,     -- ������
	name             varchar2(30)  NULL,     -- �ۼ��� �̸�
	qType            varchar2(60)  NULL      -- ���� ����
);

--drop sequence board_seq;
create sequence board_seq
increment by 1
start with 1
nocache;

-- �Խ��� �⺻Ű
CREATE UNIQUE INDEX PK_BOARD
	ON BOARD ( -- �Խ���
		boardNo ASC -- �Խñ۹�ȣ
	);

-- �Խ���
ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD -- �Խ��� �⺻Ű
		PRIMARY KEY (
			boardNo -- �Խñ۹�ȣ
		);

-- ���
CREATE TABLE REPLY (
	replyNo         number       NOT NULL, -- ��۹�ȣ
	boardNo         number       NULL,     -- �Խñ۹�ȣ
	userid          varchar2(30) NULL,     -- ���̵�
	replyContent    CLOB         NOT NULL, -- ����
	replyRegdate    date         NULL,     -- �ۼ��ð�
	groupNo         number       NOT NULL, -- �׷��ȣ
	step            char(5)      NOT NULL, -- �ܰ�
	replyDeleteDate date         NULL      -- ������
);

--drop sequence reply_seq;
create sequence reply_seq
increment by 1
start with 1
nocache;

-- ��� �⺻Ű
CREATE UNIQUE INDEX PK_REPLY
	ON REPLY ( -- ���
		replyNo ASC -- ��۹�ȣ
	);

-- ���
ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY -- ��� �⺻Ű
		PRIMARY KEY (
			replyNo -- ��۹�ȣ
		);

-- ���ã��
CREATE TABLE FAVORITE (
	favoriteNo number        NOT NULL, -- �� ��ȣ
	userid     varchar2(30)  NOT NULL, -- ���̵�
	"group"      varchar2(30)  NOT NULL, -- �з�
	isbn       varchar2(90)  NOT NULL, -- å��ȣ
	bookName   varchar2(100) NOT NULL, -- å�̸�
	writer     varchar2(30)  NOT NULL, -- ����
	publisher  varchar2(50)  NOT NULL, -- ���ǻ�
	price      number        NOT NULL  -- å����
);

--drop sequence favorite_seq;
create sequence favorite_seq
increment by 1
start with 1
nocache;

-- ���ã�� �⺻Ű
CREATE UNIQUE INDEX PK_FAVORITE
	ON FAVORITE ( -- ���ã��
		favoriteNo ASC -- �� ��ȣ
	);

-- ���ã��
ALTER TABLE FAVORITE
	ADD
		CONSTRAINT PK_FAVORITE -- ���ã�� �⺻Ű
		PRIMARY KEY (
			favoriteNo -- �� ��ȣ
		);

-- ����
CREATE TABLE BOOKGRADE (
	bookGradeNo number       NOT NULL, -- ������ȣ
	userid      varchar2(30) NULL,     -- ���̵�
	isbn        varchar2(90) NOT NULL, -- å��ȣ
	bookGrade   number       NOT NULL  -- ����
);

--drop sequence bookgrade_seq;
create sequence bookgrade_seq
increment by 1
start with 1
nocache;

-- ���� �⺻Ű
CREATE UNIQUE INDEX PK_BOOKGRADE
	ON BOOKGRADE ( -- ����
		bookGradeNo ASC -- ������ȣ
	);

-- ����
ALTER TABLE BOOKGRADE
	ADD
		CONSTRAINT PK_BOOKGRADE -- ���� �⺻Ű
		PRIMARY KEY (
			bookGradeNo -- ������ȣ
		);

-- �ֹ�
CREATE TABLE PAYMENT (
	payNo         number        NOT NULL, -- ���� ��ȣ
	userid        varchar2(30)  NOT NULL, -- ���̵�
	isbn          varchar2(90)  NOT NULL, -- å��ȣ
	bookName      varchar2(100) NOT NULL, -- å�̸�
	price         number        NOT NULL, -- �����ѱݾ�
	usePoint      number        NULL,     -- ��������Ʈ
	payDate       date          NULL,     -- ������
	cancleDate    date          NULL,     -- �����
	instrument    varchar2(30)  NOT NULL, -- ��������
	zipcode       varchar2(20)  NOT NULL, -- ������ȣ
	parselAddress varchar2(300) NOT NULL, -- �����ּ�
	newAddress    varchar2(300) NOT NULL, -- ���θ��ּ�
	addressDetail varchar2(300) NOT NULL, -- ���ּ�
	progress      varchar2(60)  NOT NULL  -- �������
);

--drop sequence payment_seq;
create sequence payment_seq
increment by 1
start with 1
nocache;

-- �ֹ� �⺻Ű
CREATE UNIQUE INDEX PK_PAYMENT
	ON PAYMENT ( -- �ֹ�
		payNo ASC -- ���� ��ȣ
	);

-- �ֹ�
ALTER TABLE PAYMENT
	ADD
		CONSTRAINT PK_PAYMENT -- �ֹ� �⺻Ű
		PRIMARY KEY (
			payNo -- ���� ��ȣ
		);

-- ���ϸ���
CREATE TABLE MILEAGE (
	mileageNo   number       NOT NULL, -- ���ϸ�����ȣ
	userid      varchar2(30) NOT NULL, -- ���̵�
	savingDate  date         NULL,     -- ������
	savingPoint number       NULL,     -- ��������Ʈ
	payNo       number       NULL,     -- ���� ��ȣ
	usePoint    number       NULL,     -- ��������Ʈ
	endDate     date         NOT NULL  -- ������
);

--drop sequence mileage_seq;
create sequence mileage_seq
increment by 1
start with 1
nocache;

-- ���ϸ��� �⺻Ű
CREATE UNIQUE INDEX PK_MILEAGE
	ON MILEAGE ( -- ���ϸ���
		mileageNo ASC -- ���ϸ�����ȣ
	);

-- ���ϸ���
ALTER TABLE MILEAGE
	ADD
		CONSTRAINT PK_MILEAGE -- ���ϸ��� �⺻Ű
		PRIMARY KEY (
			mileageNo -- ���ϸ�����ȣ
		);

-- ��õ����
CREATE TABLE RECOMMENDBOOK (
	recomBookNo number        NOT NULL, -- ��õ������ȣ
	isbn        number        NOT NULL, -- å��ȣ
	cateCode    number        NULL,     -- ī�װ��� ��ȣ
	bookName    varchar2(100) NOT NULL, -- å�̸�
	price       number        NOT NULL, -- ����
	publisher   varchar2(50)  NOT NULL, -- ���ǻ�
	writer      varchar2(30)  NOT NULL, -- ����
	managerid   varchar2(30)  NOT NULL  -- �����ھ��̵�
);

--drop sequence recommendbook_seq;
create sequence recommendbook_seq
increment by 1
start with 1
nocache;

-- ��õ���� �⺻Ű
CREATE UNIQUE INDEX PK_RECOMMENDBOOK
	ON RECOMMENDBOOK ( -- ��õ����
		recomBookNo ASC -- ��õ������ȣ
	);

-- ��õ����
ALTER TABLE RECOMMENDBOOK
	ADD
		CONSTRAINT PK_RECOMMENDBOOK -- ��õ���� �⺻Ű
		PRIMARY KEY (
			recomBookNo -- ��õ������ȣ
		);

-- �ֹ� ��
CREATE TABLE PAYMENTDETAIL (
	payNo    number        NOT NULL, -- ���� ��ȣ
	isbn     varchar2(90)  NOT NULL, -- å��ȣ
	bookName varchar2(100) NOT NULL, -- å�̸�
	qty      number        NULL,     -- ����
	price    number        NOT NULL  -- �Ǵ簡��
);

--drop sequence paymentdetail_seq;
create sequence paymentdetail_seq
increment by 1
start with 1
nocache;

-- ī�װ���
CREATE TABLE BOOKCATEGORY (
	cateCode number       NOT NULL, -- ī�װ��� ��ȣ
	cateName varchar2(60) NOT NULL, -- ī�װ�����
	regdate  date         NULL      -- �����
);

--drop sequence bookcategory_seq;
create sequence bookcategory_seq
increment by 1
start with 1
nocache;

-- ī�װ��� �⺻Ű
CREATE UNIQUE INDEX PK_BOOKCATEGORY
	ON BOOKCATEGORY ( -- ī�װ���
		cateCode ASC -- ī�װ��� ��ȣ
	);

-- ī�װ���
ALTER TABLE BOOKCATEGORY
	ADD
		CONSTRAINT PK_BOOKCATEGORY -- ī�װ��� �⺻Ű
		PRIMARY KEY (
			cateCode -- ī�װ��� ��ȣ
		);

-- �Խ���
ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_USER_TO_BOARD -- ��� -> �Խ���
		FOREIGN KEY (
			userid -- ���̵�
		)
		REFERENCES "USER" ( -- ���
			userid -- ���̵�
		);

-- ���
ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_BOARD_TO_REPLY -- �Խ��� -> ���
		FOREIGN KEY (
			boardNo -- �Խñ۹�ȣ
		)
		REFERENCES BOARD ( -- �Խ���
			boardNo -- �Խñ۹�ȣ
		);

-- ���
ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_USER_TO_REPLY -- ��� -> ���
		FOREIGN KEY (
			userid -- ���̵�
		)
		REFERENCES "USER" ( -- ���
			userid -- ���̵�
		);

-- ���ã��
ALTER TABLE FAVORITE
	ADD
		CONSTRAINT FK_USER_TO_FAVORITE -- ��� -> ���ã��
		FOREIGN KEY (
			userid -- ���̵�
		)
		REFERENCES "USER" ( -- ���
			userid -- ���̵�
		);

-- ����
ALTER TABLE BOOKGRADE
	ADD
		CONSTRAINT FK_USER_TO_BOOKGRADE -- ��� -> ����
		FOREIGN KEY (
			userid -- ���̵�
		)
		REFERENCES "USER" ( -- ���
			userid -- ���̵�
		);

-- �ֹ�
ALTER TABLE PAYMENT
	ADD
		CONSTRAINT FK_USER_TO_PAYMENT -- ��� -> �ֹ�
		FOREIGN KEY (
			userid -- ���̵�
		)
		REFERENCES "USER" ( -- ���
			userid -- ���̵�
		);

-- ���ϸ���
ALTER TABLE MILEAGE
	ADD
		CONSTRAINT FK_USER_TO_MILEAGE -- ��� -> ���ϸ���
		FOREIGN KEY (
			userid -- ���̵�
		)
		REFERENCES "USER" ( -- ���
			userid -- ���̵�
		);

-- ���ϸ���
ALTER TABLE MILEAGE
	ADD
		CONSTRAINT FK_PAYMENT_TO_MILEAGE -- �ֹ� -> ���ϸ���
		FOREIGN KEY (
			payNo -- ���� ��ȣ
		)
		REFERENCES PAYMENT ( -- �ֹ�
			payNo -- ���� ��ȣ
		);

-- ��õ����
ALTER TABLE RECOMMENDBOOK
	ADD
		CONSTRAINT FK_BOOKCATEGORY_TO_RECOMMENDBOOK -- ī�װ��� -> ��õ����
		FOREIGN KEY (
			cateCode -- ī�װ��� ��ȣ
		)
		REFERENCES BOOKCATEGORY ( -- ī�װ���
			cateCode -- ī�װ��� ��ȣ
		);

-- �ֹ� ��
ALTER TABLE PAYMENTDETAIL
	ADD
		CONSTRAINT FK_PAYMENT_TO_PAYMENTDETAIL -- �ֹ� -> �ֹ� ��
		FOREIGN KEY (
			payNo -- ���� ��ȣ
		)
		REFERENCES PAYMENT ( -- �ֹ�
			payNo -- ���� ��ȣ
		);