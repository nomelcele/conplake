------------------------ 10/13 ���̺� ����
-----------------------------------------
-----------------------------------------

  create table member(
  mem_num number(10), -- ȸ�� ��ȣ
  mem_name varchar2(20), -- ȸ�� �̸�
  mem_id varchar2(20), -- ȸ�� ���̵�
  mem_pwd varchar2(20), -- ȸ�� ��й�ȣ
  mem_mail varchar2(50), -- ȸ�� �̸��� �ּ�
  mem_birth date, -- ȸ�� �������
  mem_gender varchar2(6), -- ȸ�� ����
  mem_addr varchar2(300), -- ȸ�� �ּ�
  mem_intro varchar2(400), -- ȸ�� �ڱ� �Ұ�
  mem_img varchar2(100), -- ȸ�� �̹���
  constraint member_mem_num_pk primary key(mem_num),
  constraint member_mem_id_uq unique(mem_id),
  constraint member_mem_mail_uq unique(mem_mail),
  constraint member_mem_gender_ck check(mem_gender = 'male' or mem_gender = 'female')
  );
  
  create sequence member_seq
  increment by 1
  start with 1;
  
  create table artist(
  art_num number(8), -- ��Ƽ��Ʈ ��ȣ
  art_name varchar2(100), -- ��Ƽ��Ʈ �̸�
  art_img varchar2(100), -- ��Ƽ��Ʈ �̹���
  art_intro varchar2(800), -- ��Ƽ��Ʈ ������
  art_official varchar2(200), -- ��Ƽ��Ʈ ���� ����Ʈ �ּ�
  art_sns varchar2(200), -- ��Ƽ��Ʈ sns �ּ�
  constraint artist_art_num_pk primary key(art_num)
  );
  
  create sequence artist_seq
  increment by 1
  start with 1;
  
  create table concerthall(
  chall_num number(6), -- ������ ��ȣ
  chall_name varchar2(70), -- ������ �̸�
  chall_addr varchar2(300), -- ������ �ּ�
  chall_tel varchar2(30), -- ������ ����ó
  chall_official varchar2(200), -- ������ ���� ����Ʈ �ּ�
  chall_img varchar2(100), -- ������ �̹���
  chall_intro varchar2(400), -- ������ �Ұ�
  chall_seatsimg varchar2(100), -- ������ �¼�ǥ �̹���
  constraint concerthall_chall_num_pk primary key(chall_num)
  );
  
  create sequence concerthall_seq
  increment by 1
  start with 1;
  
  create table concert(
  con_num number(10), -- ���� ��ȣ
  con_name varchar2(200), -- ���� �̸�
  con_poster varchar2(100), -- ���� ������
  con_startdate date, -- ���� ������
  con_enddate date, -- ���� ������
  con_venue number(6), -- ���� ���
  con_artist number(8), -- �⿬��(��Ƽ��Ʈ)
  con_link varchar2(300), -- ���� ���� ��ũ
  con_detailimg varchar2(100), -- ���� �� �Ұ� �̹���
  con_rate varchar2(40), -- ���� ���� ���
  con_time varchar2(40), -- ���� ���� �ð�
  con_price varchar2(400), -- ���� ������
  con_tel varchar2(30), -- ���� ���� ���� ����ó
  constraint concert_con_num_pk primary key(con_num),
  constraint concert_con_venue_fk foreign key(con_venue) 
  references concerthall(chall_num),
  constraint concert_con_artist_fk foreign key(con_artist) 
  references artist(art_num)
  );
  
  create sequence concert_seq
  increment by 1
  start with 1;
  
  create table sightimg(
  si_num number(10), -- ���� ��ȣ
  si_imgname varchar2(200), -- ���� ���� �̸�
  si_floor number(2), -- ����
  si_standseat varchar2(10), -- ���ĵ�/�¼� ����
  si_area varchar2(20), -- ����
  si_row varchar2(10), -- ��
  si_seatnum number(5), -- �¼�
  si_concerthall number(6), -- ������ ��ȣ
  constraint sightimg_si_num_pk primary key(si_num),
  constraint sightimg_si_standseat_ck check(si_standseat='���ĵ�' or si_standseat='�¼�'),
  constraint sightimg_si_concerthall_fk foreign key(si_concerthall)
  references concerthall(chall_num)
  );
  
  create sequence sightimg_seq
  increment by 1
  start with 1;
  
  create table post(
  post_num number(12), -- �Խù� ��ȣ
  post_title varchar2(100), -- �Խù� ����
  post_author number(10), -- �Խù� �ۼ���
  post_date date, -- �Խù� �ۼ� ��¥
  post_hit number(10), -- �Խù� ��ȸ��
  post_concert number(10), -- ���� ��ȣ
  post_type varchar2(6), -- �Խù� ����
  post_seat varchar2(50), -- (�ı� form) �¼� ��ġ
  post_sightsound clob, -- (�ı� form) ������ �þ� �� ����
  post_facility clob, -- (�ı� form) ������ �ü�
  post_perform clob, -- (�ı� form) ���� ����
  post_cont clob, -- (�Բ� ���� �Խ���) �Խù� ����
  constraint post_post_num_pk primary key(post_num),
  constraint post_post_author_fk foreign key(post_author)
  references member(mem_num),
  constraint post_post_concert_fk foreign key(post_concert)
  references concert(con_num),
  constraint post_post_type_ck check(post_type = 'review' or post_type = 'with')
  );
  
  create sequence post_seq
  increment by 1
  start with 1;
  
  create table timeline(
  tl_num number(12), -- Ÿ�Ӷ��� �� ��ȣ
  tl_cont varchar2(600), -- �� ����
  tl_date date, -- �� �ۼ� ��¥
  tl_author number(10), -- �� �ۼ���
  tl_concert number(10), -- ���� ��ȣ
  constraint timeline_tl_num_pk primary key(tl_num),
  constraint timeline_tl_author_fk foreign key(tl_author)
  references member(mem_num),
  constraint timeline_tl_concert_fk foreign key(tl_concert)
  references concert(con_num)
  );
  
  create sequence timeline_seq
  increment by 1
  start with 1;
  
  create table comm(
  comm_num number(14), -- ��� ��ȣ
  comm_cont varchar2(600), -- ��� ����
  comm_author number(10), -- ��� �ۼ���
  comm_date date, -- ��� �ۼ� ��¥
  comm_post number(12), -- ����� �ۼ��� �Խù� ��ȣ
  comm_tl number(12), -- ����� �ۼ��� Ÿ�Ӷ��� �� ��ȣ
  constraint comment_comm_num_pk primary key(comm_num),
  constraint comment_comm_author_fk foreign key(comm_author)
  references member(mem_num),
  constraint comment_comm_post_fk foreign key(comm_post)
  references post(post_num) on delete cascade,
  constraint comment_comm_tl_fk foreign key(comm_tl)
  references timeline(tl_num) on delete cascade 
  );
  
  
  create sequence comm_seq
  increment by 1
  start with 1;
  
  create table userinteraction(
  ui_num number(12), -- ���� ���ͷ��� ��ȣ
  ui_member number(10), -- ���� ��ȣ
  ui_type varchar2(20), -- ���� ���ͷ��� ����
  ui_concert number(10), -- ���� �������� ��ϵ� ������ ��ȣ
  ui_artist number(8), -- ���� ��Ƽ��Ʈ�� ��ϵ� ��Ƽ��Ʈ�� ��ȣ
  ui_friend number(10), -- ģ���� �߰��� ������ ��ȣ
  constraint userinteraction_ui_num_pk primary key(ui_num),
  constraint userinteraction_ui_member_fk foreign key(ui_member)
  references member(mem_num),
  constraint userinteraction_ui_type_ck check(ui_type = 'liked_concert' or ui_type = 'liked_artist' or ui_type = 'add_friend'),
  constraint userinteraction_ui_concert_fk foreign key(ui_concert)
  references concert(con_num),
  constraint userinteraction_ui_artist_fk foreign key(ui_artist)
  references artist(art_num),
  constraint userinteraction_ui_friend_fk foreign key(ui_friend)
  references member(mem_num)
  );
  
  create sequence userinteraction_seq
  increment by 1
  start with 1;
  
  create table note(
  note_num number(12), -- ���� ��ȣ
  note_cont varchar2(1000), -- ���� ����
  note_from number(10), -- ���� ������ ���
  note_to number(10), -- ���� �޴� ���
  note_date date, -- ���� ���� ��¥
  constraint note_note_num_pk primary key(note_num),
  constraint note_note_from_fk foreign key(note_from)
  references member(mem_num),
  constraint note_note_to_fk foreign key(note_to)
  references member(mem_num)
  );
  
  create sequence note_seq
  increment by 1
  start with 1;
  
  create table song(
  song_num number(12), -- �� ��ȣ
  song_title varchar2(100), -- �� ����
  song_artist number(8), -- �� ��Ƽ��Ʈ
  song_popular varchar2(1), -- ��ǥ�� ����
  song_concert number(10), -- ���� ���ֵ� ������ ��ȣ
  song_order number(3), -- ���� ���� ����
  constraint song_song_num_pk primary key(song_num),
  constraint song_song_artist_fk foreign key(song_artist)
  references artist(art_num),
  constraint song_song_popular_ck check(song_popular = 'y' or song_popular = 'n'),
  constraint song_song_concert_fk foreign key(song_concert)
  references concert(con_num)
  );
  
  create sequence song_seq
  increment by 1
  start with 1;
  
  -- 10/30
  -- concert ���̺��� con_rate, con_time �÷� ����
  alter table concert drop(con_rate);
  alter table concert drop(con_time);

  -- concert ���̺��� con_poster, con_detailimg �Ӽ� ����
  -- ���ڼ� �� ���� �� �� �ְ� ����
  alter table concert drop(con_detailimg);
  alter table concert add(con_detailimg clob);
  
  alter table concert modify(con_name varchar2(400));
  alter table concert modify(con_poster varchar2(400));
  alter table concert modify(con_link varchar2(700));
  alter table concert modify(con_price varchar2(500));
  alter table concert modify(con_tel varchar2(200));

  commit;
  
  
  -- 11/1
  -- concerthall ���̺� �÷� ������ ���� ����
  -- gpsx, gpsy (������ ���� �����ֱ� ���� �÷�) �߰�
  
alter table concerthall modify(chall_addr varchar2(400));
alter table concerthall modify(chall_official varchar2(300));
alter table concerthall modify(chall_img varchar2(400));
alter table concerthall drop(chall_intro);
alter table concerthall add(chall_intro clob);
alter table concerthall add(chall_gpsx number(33,30));
alter table concerthall add(chall_gpsy number(33,30));
commit;

-- 11/2
-- concerthall ���̺� chall_tel �÷� ������ ���� ����
alter table concerthall modify(chall_tel varchar2(200));
commit;

-- 11/4
-- post ���̺� �÷� �߰�
-- ���� �ۼ� ��, ������ ������ ����
alter table post add(post_concertdate date);
commit;

-- 11/20
-- note ���̺� �÷� �߰�
-- note_fromdelete: 1(�⺻��) 2(���� ����� ���� ����)
-- note_todelete: 1(�⺻��) 2(���� ����� ���� ����)
alter table note add(note_fromdelete number(1));
alter table note add(note_todelete number(1));
commit;

-- 11/21
-- comm ���̺� ���� ���� �߰�
alter table comm drop(comm_post);
alter table comm drop(comm_tl);
alter table comm add(comm_post number(12));
alter table comm add constraint comm_comm_post_fk foreign key(comm_post) references post(post_num) on delete cascade;
alter table comm add(comm_tl number(12));
alter table comm add constraint comm_comm_tl_fk foreign key(comm_tl) references timeline(tl_num) on delete cascade;

-- artist ���̺� art_intro Ÿ�� ����
alter table artist drop(art_intro);
alter table artist add(art_intro clob);
alter table artist drop(art_official);
alter table artist add(art_official varchar2(200));
alter table artist drop(art_sns);
alter table artist add(art_sns varchar2(200));

select count(*) cnt from comm where comm_tl=tl_num;
update member set mem_img='kristen-stewart-advice-t.jpg' where mem_name='ũ����ƾ';

delete from comm;

-- 12/2 song ���̺� �÷� �߰�
-- ���� ��ũ
alter table song add(song_link varchar2(200));

delete from song;

-- artist ���̺� �÷� �߰�
-- ����, Ȱ�� ����, �帣
-- 12/3 �ִ� ���ڼ� ����
alter table artist drop(art_country);
alter table artist drop(art_type);
alter table artist drop(art_genre);
alter table artist add(art_country varchar2(70));
alter table artist add(art_type varchar2(20));
alter table artist add(art_genre varchar2(50));

-- 12/4 sightimg ���̺� ����� �ٽ� ����
drop table sightimg;
create table sightimg(
  si_num number(10), -- ���� ��ȣ
  si_imgname varchar2(200), -- ���� ���� �̸�
  si_floor number(2), -- ����
  si_standseat varchar2(10), -- ���ĵ�/�¼� ����
  si_area varchar2(20), -- ����
  si_row varchar2(10), -- ��
  si_seatnum number(5), -- �¼�
  si_concerthall number(6), -- ������ ��ȣ
  constraint sightimg_si_num_pk primary key(si_num),
  constraint sightimg_si_standseat_ck check(si_standseat='���ĵ�' or si_standseat='�¼�'),
  constraint sightimg_si_concerthall_fk foreign key(si_concerthall)
  references concerthall(chall_num)
  );
  
  insert into userinteraction values(userinteraction_seq.nextVal,94,'add_friend',null,null,61);
  insert into userinteraction values(userinteraction_seq.nextVal,94,'add_friend',null,null,42);
  insert into userinteraction values(userinteraction_seq.nextVal,94,'add_friend',null,null,21);
  insert into userinteraction values(userinteraction_seq.nextVal,94,'add_friend',null,null,95);
  insert into userinteraction values(userinteraction_seq.nextVal,94,'add_friend',null,null,96);

  insert into note values(note_seq.nextVal,'test',61,94,sysdate,1,1);
  insert into note values(note_seq.nextVal,'test2',42,94,sysdate,1,1);
  insert into note values(note_seq.nextVal,'test3',21,94,sysdate,1,1);
  insert into note values(note_seq.nextVal,'test4',61,94,sysdate,1,1);
  insert into note values(note_seq.nextVal,'test5',94,21,sysdate,1,1);
  insert into note values(note_seq.nextVal,'test6',94,95,sysdate,1,1);
  
  -- 12/6 �ܼ�Ʈ ������ ���� ��ȣ ����
  drop sequence concert_seq;
  create sequence concert_seq increment by 1 start with 10000000;