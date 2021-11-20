create database WebYte
go

Drop database WebYte
use WebYte
go

create table Man(
	idman int identity(1,1) primary key,
	name nvarchar(100) not null,
	username nvarchar(100)  unique,
	password nvarchar(100) not null,
	email varchar(100) unique,
	phone varchar(15),
	address nvarchar(100) ,
	birth datetime,	
	role int

)
create table Cart(
	idcart int identity(1,1) not null primary key,
	totalprice float not null,
	idman int not null,

	foreign key (idman) references Man(idman),

)

create table Category(
	idcate int identity(1,1) not null primary key,
	name nvarchar(100) not null,
	CStatus bit
)
create table Product(
	idpro int identity(1,1) not null primary key,
	namepro nvarchar(100) not null,
	price float not null,
	image nvarchar(500) not null,
	description nvarchar(2000) not null,
	idcate int ,
	PStatus bit

	foreign key (idcate) references Category(idcate)
)
create table InfoCart(
	idifc int identity(1,1) not null primary key,
	amount int not null,
	idcart int not null,
	idpro int not null,

	foreign key (idcart) references Cart(idcart),
	foreign key (idpro) references Product(idpro)
)
create table Bill(
	idbill int identity(1,1) not null primary key,
	address nvarchar(100) default null,
	note nvarchar(100) default null,
	customername nvarchar(100) default null,
	datein datetime default null,
	dateout datetime default null,
	phoneout varchar(100) default null,
	status varchar(100) default null,
	idcus int default null,
	

	foreign key (idcus) references Man(idman),
	
)
create table InfoBill(
	price float null,
	idpro int not null,
	idbill int not null,
	count int null	
)
create table Contact(
	idcon int identity(1,1) not null primary key,
	emailcon varchar(100) not null,
	datein datetime default null,
	dateout datetime default null,
	textin nvarchar(100) not null,
	textout nvarchar(100) not null,
	status varchar(100) not null,
	idman int not null,

	foreign key (idman) references Man(idman)
)

create table Admin(
	useradmin varchar(30) primary key,
	passadmin varchar(30) not null,
	name nvarchar(50)
)

INSERT INTO Category(name, CStatus) VALUES(N'Chăm sóc cá nhân','True')
INSERT INTO Category(name, CStatus) VALUES(N'Dược phẩm','True')
INSERT INTO Category(name, CStatus) VALUES(N'Thực phẩm chức năng','True')
INSERT INTO Category(name, CStatus) VALUES(N'Thiết bị y tế','True')
INSERT INTO Category(name, CStatus) VALUES(N'Chăm sóc sắc đẹp','True')
INSERT INTO Category(name, CStatus) VALUES(N'Mẹ và bé','True')
INSERT INTO Category(name, CStatus) VALUES(N'Chăm sóc sức khỏe','True')

INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bàn chải điện Philips','banchaiphilips.jpg',N'Bàn chải điện Philips có độ rung chuyển mạnh loại bỏ hết các chất bẩn',600000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bàn chải điện P/S','banchaidienps.jpg',N'Bàn chải điện P/S có độ rung chuyển mạnh loại bỏ hết các chất bẩn',500000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem đánh răng Aquafresh','aquafresh.jpg',N'Kem đánh răng AquaFresh giúp làm sạch răng miệng và đánh bóng răng, ngăn ngừa sâu răng, cho răng, nướu chắc khoẻ và cho cảm giác sạch sẽ, thơm mát lên đến 80%',80000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bàn chải Colgate','banchaicolgate.jpg',N'Bàn chải Colgate có những lông được làm từ tre, với độ mỏng lên tới 80%',50000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bàn chải P/S','banchaips.jpg',N'Bàn chải P/S có những lông siêu vi, với độ mỏng lên tới 80%',50000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bàn chải Sensodyne','banchaisensodyne.jpg',N'Bàn chải Sensodyne có những lông siêu vi, với độ mỏng lên tới 80%',50000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bàn chải voi xanh DrBrowns','banchaivoixanh.jpg',N'Bàn chải voi xanh DrBrowns thuộc cho trẻ em, với ngoại hình bắt mắt khiến cho việc đánh răng của bé thêm niềm vui',30000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bộ 3 bàn chải Puri','bo3banchai.jpg',N'Bàn chải Puri có những lông siêu vi, với độ mỏng lên tới 80%',90000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem đánh răng Colgate ngừa sâu răng',N'colgatenguasaurang.jpg','Kem đánh răng Colgate ngừa sâu răng tối đa giúp bảo vệ răng, tăng cường canxi cho răng, giúp răng luôn tươi sáng và cứng cáp',40000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem đánh răng Crest ','crest.jpg',N'Kem đánh răng Crest có khả năng làm trắng lên đến 3 lần',40000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem đánh răng Darlie','darlietrxanh.jpg',N'Kem đánh răng Darlie có sức đánh trắng với những răng ố vàng cùng hương thơm trà xanh tươi mát',50000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem đánh răng P/S than hoạt tính','psthanhoattinh.jpg',N'Kem đánh răng P/S than hoạt tính có tinh chất tre và than giúp răng trắng tự nhiên',50000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem đánh răng P/S trà xanh','pstraxanh.jpg',N'Kem đánh răng P/S trà xanh giúp răng trắng tự nhiên và giảm cảm giác ê buốt',50000,'1','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem đánh răng Sensodyne ','sensodyne.jpg',N'Kem đánh răng Sensodyne có khả năng làm trắng răng và bảo vệ răng một cách tốt nhất',40000,'1','True')

INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Paracetamol ','paracetamol.jpg',N'Giảm đau nhanh các triệu chứng sốt, đau nhức và khó chịu như nhức đầu, đau tai, đau răng, đau nhức do cảm cúm',450000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bedipanthen B5 100mg ','Bedipanthen B5 100mg.jpg',N'Viên uống Bedipanten 100mg bổ sung vitamin B5 cho cơ thể, giúp cải thiện tình trạng thiếu hụt vitamin B5 trong các trường hợp: rối loạn tiết chất nhờn ở da, hạn chế rụng tóc, đau dây thần kinh.',380000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Cetirizine 10 ','Cetirizine 10.jpg',N'Thuốc Cetirizine là một loại thuốc được dùng để điều trị dị ứng, hoạt chất là cetirizine hydrochloride hoặc cetirizine dihydrochloride. Thuốc được bào chế dưới nhiều dạng dùng như: Viên nén bao phim, viên nang, dung dịch uống hoặc siro.',235000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Hoạt huyết nhất nhất ','hoathuyetnhatnhat.jpg',N' Phòng ngừa và điều trị thiểu năng tuần hoàn não (mệt mỏi, đau đầu, chóng mặt, mất thăng bằng, hoa mắt, mất ngủ, suy giảm trí nhớ, suy nhược thần kinh),',250000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Dạ dày nhất nhất ','dadaynhatnhat.png',N'Trị viêm loét dạ dày, hành tá tràng cấp và mãn tính, đau rát vùng thượng vị.
Cho trường hợp người bị rối loạn tiêu hóa, ăn chậm tiêu, chán ăn, đầy hơi, chướng bụng, sôi bụng, ợ.',250000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Meken nhất nhất ','Mekennhatnhat.png',N'Hỗ trợ điều trị người bị tai biến mạch máu não, người bị di chứng tai biến, người bệnh mạch vành, đau thắt ngực.',235000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Xương khớp nhất nhất ','Xuongkhapnhatnhat.jpg',N'Trị đau lưng, đau cột sống, đau thần kinh tọa và các chứng phong tê thấp. Hỗ trợ điều trị thoái hóa khớp, vôi hóa, gai đốt sống.',245000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Viên ngậm bảo thanh ','vienngambaothanh.jpg',N'Giảm chiệu chứng ho khan, ho có đờm ở dạng viên ngậm.',90000,'2','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Thuốc ho bảo thanh ','thuochobaothanh.jpg',N'Giảm chiệu chứng ho khan, ho có đờm ở dạng viên nén.',120000,'2','True')

INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'FiberDiet ','FiberDiet.jpg',N'Thuốc bổ xuất sứ từ Mỹ giúp hỗ trợ đường huyết và tăng sức đề kháng',650000,'3','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Turmeric ','Turmeric.jpg',N'Thuốc bổ xuất sứ từ Mỹ giúp hỗ trợ đường huyết và tăng sức đề kháng',590000,'3','True')

INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Nước súc miệng Ngọc Châu ','nuocsucmiengngocchau.jpg',N'Nước súc miệng dược liệu Ngọc Châu được bào chế, sản xuất trên dây chuyền công nghệ tiên tiến, được tham vấn về chuyên môn bệnh học bởi các Chuyên gia Nha khoa.',108000,'3','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Xịt mũi Zuchi ','xitkhumuiZuchi.jpg',N'Zuchi Thảo dược dạng xịt, nhỏ gọn dễ sử dụng, có thể mang theo người, tiện dùng mọi lúc, mọi nơi.',86000,'3','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Đông trụ hạ thảo AlohaOganic USA ','DongtruhathaoAlohaOrganicUSA.jpg',N' là một trong những thực phẩm chức năng chăm sóc sức khỏe được người tiêu dùng đánh giá cao hiện nay.',890000,'3','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Alipas ','Alipas.jpg',N'Hỗ trợ tăng cường sức khỏe sinh lý - Cải thiện tình trạng rối loạn cương, cải thiện hội chứng mãn dục nam.',435000,'3','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Angela Gold ','AngeleGold.jpg',N'Sản phẩm có thành phần 100% từ thiên nhiên, đã được kiểm chứng khoa học về công dụng và độ an toàn cho sức khỏe khi sử dụng lâu dài. Trong đó, nổi bật là sự kết hợp của bộ đôi tinh chất quý Lepidium Meyenii và P. Leucotomos.',420000,'3','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Ích thận vương ','ichthanvuong.jpg',N'Hỗ trợ giảm biểu hiện phù thũng, rối loạn tiểu tiện, tiểu khó, tiểu rắt, vô niệu do thận kém.',360000,'3','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Xoang Bách Phục ','Xoanbachphuc.jpg',N'Thực phẩm chức năng giúp giảm dị ứng, bớt viêm xoang Xoang Bách Phục',290000,'3','True')

INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bông gòn ý tế Bảo Thạch ','bonggonytebaothach.jpg',N'Siêu thấm hút, giúp làm lành vết thương một cách nhẹ cmn nhàng',10000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Cồn ý tế 90 độ OPC ','conyte90doopc.jpg',N'Dung dịch sát khuẩn chứa cồn giúp làm lành vết thương và sát khuẩn',250000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Dung dịch sát khuẩn tay ','dungdichsatkhuantay.jpg','Nước rửa tay sát khuẩn, giúp diệt vi khuẩn có hại và có mùi hương diệu nhẹ, phù hợp với mọi người dùng.',35000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Hộp găng tay y tế Latex ','gangtayytelatex.jpg',N'Găng tay siêu mỏng được làm từ cao su dẻo chất lượng cao, thường dùng trong y tế.',50000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Khẩu trang KF94 ','khautrangkf94.jpg',N'Khẩu trang KF94 được nhập khẩu từ mỹ với 3 lớp siêu chống bụi và vi khuẩn.',25000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Khẩu trang N95 ','khautrangn95.jpg',N' Một trong những khẩu trang tốt nhất với màng bọc siêu chống thấm.',85000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Xịt mũi Xitsat ','xitmuixitsat.jpg',N'Dung dịch xịt mũi giúp lỗ mũi thông thoáng, tránh tình trạng tắc nghẽn, giảm viêm xoan hiệu quả.',60000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Dung dịch sát khuẩn Providine ','dungdichsatkhuanprovidine.jpg',N'Dung dich sát khuẩn(Thuốc đỏ) chứa atisilit giúp giảm viêm, giảm đau hiệu quả cho các vết thương',25000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Gạt ý tế Quick Nurse ','gatytequicknurse.jpg',N'Gạt băng vết thương giúp băng bó những vết thương hở',60000,'4','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Máy đo huyết áp OMRON ','maydohuyetapomron.jpg',N'Máy đo huyết áp thương hiệu ORMON thương hiệu anh.',1200000,'4','True')


INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem rửa mặt Vitamin Aces ','KemruamatVitaminAcnes.jpg',N'Làm sạch da, giúp da sáng mịn màng, mờ vết thâm.',83000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Decuma ','Decuma.jpg',N'Các sản phẩm sử dụng thành phần thiên nhiên dịu nhẹ, trong đó nổi bật là nghệ Nano Curcumin siêu hấp thu với khả năng thẩm thấu gấp 7.500 lần so với nghệ thường, an toàn, phù hợp mọi loại da.',75000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Dầu gội dược liệu Nguyên Xuân ','daugoiduoclieunguyenxuan.jpg',N'Dầu gội dược liệu Nguyên Xuân được chiết xuất hoàn toàn từ các nguyên liệu có trong tự nhiên.',166000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Sửa rữa mặt Cetaphil ','SuaruamatCetaphil.jpg',N'Với công thức lành tính, sữa rửa mặt Cetaphil Gentle Skin Cleanser giúp loại bỏ bụi bẩn một cách nhẹ nhàng.',250000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Sửa tắm doubleRich ','Suatamdoublerich.jpg',N'Đây là thương hiệu thuộc tập đoàn LG H&H chuyên nghiên cứu và phát triển các dòng mỹ phẩm dành cho phái đẹp.',245000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Sữa tắm LifeBuoy ','SuatamLifeBouy.jpg',N'Sữa tắm Lifebuoy Bảo vệ Vượt trội 10 giúp bảo vệ bạn và gia đình khỏi 10 nguyên nhân gây viêm da.',165000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Mặt nạ dưỡng trắng da Amisilk Hàn Quốc ','matnaduondaWhitePearlMask AmisilkHQ.jpg',N'Mặt nạ dưỡng da Collagen Amisilk Hàn Quốc – Collagen Mask, cung cấp collagen và các dưỡng chất thiết yếu giúp phục hồi và nuôi dưỡng làn da, chống lão hóa, trả lại cho da vẻ tươi trẻ.',35000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem dưỡng ẩm Vaseline ','kemduongam.jpg',N'Vaseline có thể được sử dụng như một loại kem dưỡng ẩm hàng ngày cho da rất khô.',68000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Sữa rữa mặt E100 ','suaruamate100.jpg',N'E100 là thương hiệu mỹ phẩm nổi tiếng của Việt Nam, thuộc Công ty TNHH sản xuất và thương mại Đại Việt Hương (VIETCOS). Sản phẩm của thương hiệu này rất đa dạng với sữa rửa mặt, sữa tắm và sữa dưỡng thể….',25000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Kem trị mụn Aces ','KemtrimunAces.jpg',N'Kem trị mụn thương hiệu Aces chiết xuất từ thiên nhiên, phù hợp với da dầu và da nhạy cảm.',105000,'5','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Sữa tắm xích ý TesoriOriente 750ml ','SuatamxichytesoriOriente 750ml.jpg',N'Với công thức chăm sóc da dưỡng ẩm độc đáo, sữa tắm dây xích Tesori D Oriente giúp cung cấp độ ẩm cho da, giúp làn da trông luôn tươi trẻ và đầy sức sống.',350000,'5','True')


INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Bình sữa Avent Classic 125ml ','binhsuaaventclassic125ml.jpg',N'Sản phẩm cao cấp, dung tích: 125ml, chất liệu silicone & nhựa PA an toàn, thiết kế bền đẹp, vạch đo thể tích rõ ràng.',70000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Dầu ăn Kiddy ','dauankiddy.jpg',N'Dầu ăn Kiddy 250ml cung cấp DHA, EPA tự nhiên, Omega 3, Omega 6, Omega 9, Vitamin A, Vitamin E và hơn 20 loại axit béo thiết yếu giúp cho trẻ phát triển một cách toàn diện não bộ, thị giác và cơ thể trong giai đoạn đầu đời và đến lúc bé 8 tuổi.',75000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Tả quần Bobby ','taquanbobby.jpg',N'Thiết kế ứng dụng Công nghệ Unicharm NSX số 1* Nhật Bản, vừa vặn, ngăn tràn cho bé thoải mái vận động khám phá.',405000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Thuốc bổ thai Prenatal ','thuocbothaiprenatal.jpg',N'Nature Made Prenatal Multi + DHA - Vitamin Tổng Hợp Cho Bà Bầu Của Mỹ',650000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Thuốc bổ mắt vitamin','Thuocbomatvitaminablackmores,jpg','Cung cấp dưỡng chất cần thiết cho võng mạc của mắt, bảo vệ võng mạc khỏi những tổn thương bên trong, bồi bổ cho mắt và hỗ trợ điều trị các bệnh về mắt.',368000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Sữa bột Aptamil ','suabotaptamil.jpg',N'Sữa Aptamil là sản phẩm dinh dưỡng công thức số 1 châu Âu, được mệnh danh loại sữa mát nhất hiện nay, hương thơm ngậy, vị nhạt, dễ uống, có đặc tính giống sữa mẹ hoàn toàn phù hợp cho từng giai đoạn phát triển của con.',480000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Sữa ong chúa úc Healthy Care ','suaongchuauchealthycare.jpg',N'Sữa ong chúa healthy care royal jelly 1000mg 365 viên chính hãng từ Úc Bạn đang cần sữa ong chúa 1000mg? Đừng bỏ qua sản phẩm sữa ong chúa Healthy Care, thương hiệu nổi tiếng tại Úc được nhiều khách hàng tại Việt Nam tin dùng và đánh giá cao về chất...',399000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Thuốc bổ sung vitamin Enervonc 500mg ','thuocbosungvitaminenervonc500mg.jpg',N'Thuốc Enervon là thuốc giúp bổ sung vitamin trong trường hợp cơ thể thiếu hụt hoặc tăng nhu cầu.',280000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Tinh dầu tràm quế hương Pharma ','tinhdautramquehuongpharma.jpg',N'Tinh dầu tràm có tên gọi tiếng Anh là Cajeput Oil, là một loại tinh dầu tự nhiên, được chiết xuất từ thân, cành, lá của cây tràm bằng phương pháp chưng cất hơi nước.',65000,'6','True')
INSERT INTO Product(namepro,image,description,price,idcate,PStatus) VALUES(N'Vitamin C 500mg ','vitaminc500mg.jpg',N'Uống vitamin C bằng đường uống hoặc đường tiêm sẽ giúp ngăn ngừa và điều trị thiếu vitamin C, bao gồm cả bệnh scurvy. Ngoài ra, uống vitamin C có thể đảo ngược các vấn đề liên quan đến bệnh scurvy.',265000,'6','True')
