-- ��Ƽ��Ʈ ��ȣ, ��Ƽ��Ʈ �̸�, ��Ƽ��Ʈ �̹���, ��Ƽ��Ʈ �Ұ�, ��Ƽ��Ʈ ���� Ȩ������, ��Ƽ��Ʈ sns
insert into artist values(artist_seq.nextVal,'���̾� ���̽�',null,null,null,null);
update concert set con_artist = 1 where con_num=103782 or con_num=103781;
commit;