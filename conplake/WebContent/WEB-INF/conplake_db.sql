------------------------ 10/13 테이블 생성
-----------------------------------------
-----------------------------------------

  create table member(
  mem_num number(10), -- 회원 번호
  mem_name varchar2(20), -- 회원 이름
  mem_id varchar2(20), -- 회원 아이디
  mem_pwd varchar2(20), -- 회원 비밀번호
  mem_mail varchar2(50), -- 회원 이메일 주소
  mem_birth date, -- 회원 생년월일
  mem_gender varchar2(6), -- 회원 성별
  mem_addr varchar2(300), -- 회원 주소
  mem_intro varchar2(400), -- 회원 자기 소개
  mem_img varchar2(100), -- 회원 이미지
  constraint member_mem_num_pk primary key(mem_num),
  constraint member_mem_id_uq unique(mem_id),
  constraint member_mem_mail_uq unique(mem_mail),
  constraint member_mem_gender_ck check(mem_gender = 'male' or mem_gender = 'female')
  );
  
  create sequence member_seq
  increment by 1
  start with 1;
  
  create table artist(
  art_num number(8), -- 아티스트 번호
  art_name varchar2(100), -- 아티스트 이름
  art_img varchar2(100), -- 아티스트 이미지
  art_intro varchar2(800), -- 아티스트 프로필
  art_official varchar2(200), -- 아티스트 공식 사이트 주소
  art_sns varchar2(200), -- 아티스트 sns 주소
  constraint artist_art_num_pk primary key(art_num)
  );
  
  create sequence artist_seq
  increment by 1
  start with 1;
  
  create table concerthall(
  chall_num number(6), -- 공연장 번호
  chall_name varchar2(70), -- 공연장 이름
  chall_addr varchar2(300), -- 공연장 주소
  chall_tel varchar2(30), -- 공연장 연락처
  chall_official varchar2(200), -- 공연장 공식 사이트 주소
  chall_img varchar2(100), -- 공연장 이미지
  chall_intro varchar2(400), -- 공연장 소개
  chall_seatsimg varchar2(100), -- 공연장 좌석표 이미지
  constraint concerthall_chall_num_pk primary key(chall_num)
  );
  
  create sequence concerthall_seq
  increment by 1
  start with 1;
  
  create table concert(
  con_num number(10), -- 공연 번호
  con_name varchar2(200), -- 공연 이름
  con_poster varchar2(100), -- 공연 포스터
  con_startdate date, -- 공연 시작일
  con_enddate date, -- 공연 종료일
  con_venue number(6), -- 공연 장소
  con_artist number(8), -- 출연자(아티스트)
  con_link varchar2(300), -- 공연 예매 링크
  con_detailimg varchar2(100), -- 공연 상세 소개 이미지
  con_rate varchar2(40), -- 공연 관람 등급
  con_time varchar2(40), -- 공연 관람 시간
  con_price varchar2(400), -- 공연 관람료
  con_tel varchar2(30), -- 공연 관련 문의 연락처
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
  si_num number(10), -- 사진 번호
  si_imgname varchar2(200), -- 사진 파일 이름
  si_floor number(2), -- 층수
  si_standseat varchar2(10), -- 스탠딩/좌석 여부
  si_area varchar2(20), -- 구역
  si_row varchar2(10), -- 열
  si_seatnum number(5), -- 좌석
  si_concerthall number(6), -- 공연장 번호
  constraint sightimg_si_num_pk primary key(si_num),
  constraint sightimg_si_standseat_ck check(si_standseat='스탠딩' or si_standseat='좌석'),
  constraint sightimg_si_concerthall_fk foreign key(si_concerthall)
  references concerthall(chall_num)
  );
  
  create sequence sightimg_seq
  increment by 1
  start with 1;
  
  create table post(
  post_num number(12), -- 게시물 번호
  post_title varchar2(100), -- 게시물 제목
  post_author number(10), -- 게시물 작성자
  post_date date, -- 게시물 작성 날짜
  post_hit number(10), -- 게시물 조회수
  post_concert number(10), -- 공연 번호
  post_type varchar2(6), -- 게시물 유형
  post_seat varchar2(50), -- (후기 form) 좌석 위치
  post_sightsound clob, -- (후기 form) 공연장 시야 및 음향
  post_facility clob, -- (후기 form) 공연장 시설
  post_perform clob, -- (후기 form) 공연 내용
  post_cont clob, -- (함께 가요 게시판) 게시물 내용
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
  tl_num number(12), -- 타임라인 글 번호
  tl_cont varchar2(600), -- 글 내용
  tl_date date, -- 글 작성 날짜
  tl_author number(10), -- 글 작성자
  tl_concert number(10), -- 공연 번호
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
  comm_num number(14), -- 댓글 번호
  comm_cont varchar2(600), -- 댓글 내용
  comm_author number(10), -- 댓글 작성자
  comm_date date, -- 댓글 작성 날짜
  comm_post number(12), -- 댓글이 작성된 게시물 번호
  comm_tl number(12), -- 댓글이 작성된 타임라인 글 번호
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
  ui_num number(12), -- 유저 인터랙션 번호
  ui_member number(10), -- 유저 번호
  ui_type varchar2(20), -- 유저 인터랙션 유형
  ui_concert number(10), -- 관심 공연으로 등록된 공연의 번호
  ui_artist number(8), -- 관심 아티스트로 등록된 아티스트의 번호
  ui_friend number(10), -- 친구로 추가된 유저의 번호
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
  note_num number(12), -- 쪽지 번호
  note_cont varchar2(1000), -- 쪽지 내용
  note_from number(10), -- 쪽지 보내는 사람
  note_to number(10), -- 쪽지 받는 사람
  note_date date, -- 쪽지 보낸 날짜
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
  song_num number(12), -- 곡 번호
  song_title varchar2(100), -- 곡 제목
  song_artist number(8), -- 곡 아티스트
  song_popular varchar2(1), -- 대표곡 여부
  song_concert number(10), -- 곡이 연주된 공연의 번호
  song_order number(3), -- 곡의 공연 순서
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
  -- concert 테이블의 con_rate, con_time 컬럼 삭제
  alter table concert drop(con_rate);
  alter table concert drop(con_time);

  -- concert 테이블의 con_poster, con_detailimg 속성 변경
  -- 글자수 더 많이 들어갈 수 있게 변경
  alter table concert drop(con_detailimg);
  alter table concert add(con_detailimg clob);
  
  alter table concert modify(con_name varchar2(400));
  alter table concert modify(con_poster varchar2(400));
  alter table concert modify(con_link varchar2(700));
  alter table concert modify(con_price varchar2(500));
  alter table concert modify(con_tel varchar2(200));

  commit;
  
  
  -- 11/1
  -- concerthall 테이블 컬럼 데이터 길이 변경
  -- gpsx, gpsy (공연장 지도 보여주기 위한 컬럼) 추가
  
alter table concerthall modify(chall_addr varchar2(400));
alter table concerthall modify(chall_official varchar2(300));
alter table concerthall modify(chall_img varchar2(400));
alter table concerthall drop(chall_intro);
alter table concerthall add(chall_intro clob);
alter table concerthall add(chall_gpsx number(33,30));
alter table concerthall add(chall_gpsy number(33,30));
commit;

-- 11/2
-- concerthall 테이블 chall_tel 컬럼 데이터 길이 변경
alter table concerthall modify(chall_tel varchar2(200));
commit;

-- 11/4
-- post 테이블에 컬럼 추가
-- 리뷰 작성 시, 공연의 관람일 저장
alter table post add(post_concertdate date);
commit;

-- 11/20
-- note 테이블에 컬럼 추가
-- note_fromdelete: 1(기본값) 2(보낸 사람이 쪽지 삭제)
-- note_todelete: 1(기본값) 2(받은 사람이 쪽지 삭제)
alter table note add(note_fromdelete number(1));
alter table note add(note_todelete number(1));
commit;

-- 11/21
-- comm 테이블에 제약 조건 추가
alter table comm drop(comm_post);
alter table comm drop(comm_tl);
alter table comm add(comm_post number(12));
alter table comm add constraint comm_comm_post_fk foreign key(comm_post) references post(post_num) on delete cascade;
alter table comm add(comm_tl number(12));
alter table comm add constraint comm_comm_tl_fk foreign key(comm_tl) references timeline(tl_num) on delete cascade;

-- artist 테이블 art_intro 타입 변경
alter table artist drop(art_intro);
alter table artist add(art_intro clob);
alter table artist drop(art_official);
alter table artist add(art_official varchar2(200));
alter table artist drop(art_sns);
alter table artist add(art_sns varchar2(200));

select count(*) cnt from comm where comm_tl=tl_num;
update member set mem_img='kristen-stewart-advice-t.jpg' where mem_name='크리스틴';

delete from comm;

-- 12/2 song 테이블 컬럼 추가
-- 비디오 링크
alter table song add(song_link varchar2(200));

delete from song;

-- artist 테이블 컬럼 추가
-- 국가, 활동 유형, 장르
-- 12/3 최대 글자수 변경
alter table artist drop(art_country);
alter table artist drop(art_type);
alter table artist drop(art_genre);
alter table artist add(art_country varchar2(70));
alter table artist add(art_type varchar2(20));
alter table artist add(art_genre varchar2(50));

-- 12/4 sightimg 테이블 지우고 다시 만듦
drop table sightimg;
create table sightimg(
  si_num number(10), -- 사진 번호
  si_imgname varchar2(200), -- 사진 파일 이름
  si_floor number(2), -- 층수
  si_standseat varchar2(10), -- 스탠딩/좌석 여부
  si_area varchar2(20), -- 구역
  si_row varchar2(10), -- 열
  si_seatnum number(5), -- 좌석
  si_concerthall number(6), -- 공연장 번호
  constraint sightimg_si_num_pk primary key(si_num),
  constraint sightimg_si_standseat_ck check(si_standseat='스탠딩' or si_standseat='좌석'),
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
  
  -- 12/6 콘서트 시퀀스 시작 번호 변경
  drop sequence concert_seq;
  create sequence concert_seq increment by 1 start with 10000000;