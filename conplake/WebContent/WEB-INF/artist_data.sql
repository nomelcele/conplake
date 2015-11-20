-- 아티스트 번호, 아티스트 이름, 아티스트 이미지, 아티스트 소개, 아티스트 공식 홈페이지, 아티스트 sns
insert into artist values(artist_seq.nextVal,'데미안 라이스',null,null,null,null);
update concert set con_artist = 1 where con_num=103782 or con_num=103781;
commit;

update song set song_title='The Blower''s Daughter' where song_num=2;
update song set song_title='9 Crimes' where song_num=3;
commit;