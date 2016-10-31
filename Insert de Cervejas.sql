select * from copo;
select * from cor;
select * from estilo;
select * from nacionalidade where NomePais like '%bras%';
select * from cerveja;

insert into estilo values(10, 'American Pale Ale');
insert into estilo values(11, 'Old Ale');
insert into estilo values(12, 'American Brown Ale');
insert into estilo values(13, 'Sem Álcool');

-- INSERT DE CERVEJAS --

insert into cerveja(idCerveja,Nome,DescricaoCerveja,TeorAlcoolico,TemperaturaIdeal,
			ProporcaoodemaltedeCevada,Preco,idCopo,idCor,idNacionalidade,idEstilo,Imagem)
				values(1, 'EERDINGER WEISSBIER', 'É uma Cerveja leve, viva, muito aromática e refrescante, de sabor incomparável, 
					clássica entre as cervejas de trigo.
			Harmoniza com peixes e frutos do mar, saladas, grelhados, salsichas e pratos apimentados.',
            5.3, 6, 7, 29.99, 13, 2, 5, 7, 1),
						(2, 'WEIHENSTEPHANER HEFEWEISSBIER', 'Cerveja de trigo extremamente refrescante, turva e natural. Sua fragrância e paladar são resultados das leveduras especiais que participam de sua composição. Apresenta aroma e paladar de banana e cravo e é considera como referência das cervejas de trigo alemã.',
                        5.4, 6, 3, 22.90, 13, 6, 5, 7, 1),
                        (3, 'HOFBRÄU MÜNCHNER WEISSE', 'Deliciosamente frisante e refrescante, com excelente acidez e sabor frutado e condimentado. É perfeita para acompanhar sushis, frutos do mar, salsichão branco grelhado, saladas e pratos da culinária tailandesa. A levedura presente na garrafa deve ser servida junto com a cerveja para garantir sua turbidez típica.',
                        5.1, 6, 4, 18.61, 13, 6, 5, 7, 1),
                        (4, 'COOPERS ORIGINAL PALE ALE' , 'É uma Cerveja agradavelmente saborosa, leve e refrescante. A Coopers Original Pale Ale conquistou uma nova geração de apreciadores para as Ales. Deliciosamente australiana, vai bem a qualquer hora. É produzida somente com água, malte, lúpulo e levedura. Passa por uma segunda fermentação dentro da garrafa, que lhe confere maior frescor e validade mais longa.',
                        4.5, 11, 12,22.90, 12, 3, 17, 10, 1),
						(5, 'COOPERS VINTAGE ALE', 'Seu sabor é frutado, com um leve amargor. Coopers Vintage Ale é produzida com malte especial e por um longo tempo de fermentação. Em barris de carvalho, seu conteúdo é armazenado e seu sabor se aprimora ao passar do tempo. O aroma frutado é percebido tanto quanto a dose generosa de lúpulo Saaz utilizado em sua fabricação',
                        7.5, 11, 8, 27.90, 6, 7, 17, 11, 1),
                        (6, 'COOPERS DARK BROWN ALE', 'Este é um estilo interessante originário da Inglaterra, já que antecede e dá origem ao famoso estilo porter e consequentemente a stout. A região norte produz uma brown ale com características e coloração castanho avermelhada que encontramos nesta Coopers.',
						4.5, 6, 4, 22.90, 9, 10, 17, 12, 1),
                        (7, 'BALTIKA 0 BEZALKOGOLNOE SEM ÁLCOOL', 'A Baltika começou a produzir sua Cerveja Sem Álcool em 2001. Tem um sabor suave com um aroma de malte agradável e, idealmente, corresponde ao estilo de Cerveja clássico.',
                        0, 3, 0, 23.90,12, 6,  201, 13, 1),
                        (8, 'BALTIKA 5 GOLD PREMIUM LAGER', 'Baltika Gold 5 é uma Cerveja especial fabricada a partir de uma exclusiva receita que equilibra os maltes claros com amargor do lúpulo. Possui uma cor amarelo claro e espuma branca.',
                        5.2, 0, 7, 23.90, 6, 1, 201, 2, 1),
                        (9, 'BUDWEISER', 'Uma Budweiser leva 30 dias para ser produzida. É muito mais tempo que qualquer outra cerveja similar.',
						5, 0, 5, 6.50, 6, 3, 69, 2, 1),
                        (10, 'CORONA EXTRA', 'Cerveja mexicana de enorme sucesso nos anos 90. A cerveja Corona é uma cerveja Pilsen leve, tem sua acidez reforçada quando se coloca uma rodela de limão no gargalo',
                        4.6, 0, 4, 6.50, 6, 2, 162, 3, 1),
                        (11, 'HEINEKEN', 'A Heineken é uma das mais famosas cervejas vendidas no mundo. Aqui no Brasil, a Heineken é produzida e distribuida pela Cervejaria Heineken, exceto o keg e a lata, que são importados da Holanda.',
                        5, 5, 5, 6.50, 6, 5, 5, 2, 1),
                        (12, 'EISENBAHN', 'No mundo inteiro, ela é a mais consumida. A pilsen agrada a todos os paladares, e quando é produzida com os mais puros ingredientes, ela fica melhor ainda. Essa é a Eisenbahn pilsen. Uma bebida leve, de cor dourada, baixa fermentação, suavemente amarga e de médio teor alcoólico.',
                        4.8, 0, 7, 5.90, 6, 6, 33, 2, 1),
                        (13, 'CACILDIS DO MUSSUM', 'A Cerveja cacildis é uma lager premium dourada, leve, equilibrada e muito refrescante.

Tipicamente de boteco essa cerveja é perfeita para matar a sede, reunir os amigos, jogar conversa fora e saborear junto petiscos e porções.

Essa a segunda cerveja feita em homenagem a um dos maiores humoristas do Brasil: mussum dos Trapalhões.

Ela com certeza vai provocar um inevitável "Cacildis!" de satisfação da primeira à última beiçadis.',
						5, 0, 5, 12.90, 11, 6, 33, 2,1),
                        (14, 'DITRIGUIS DO MUSSUM ', 'A cerveja DiTriguis é a mais nova homenagem do filho do Mussum ao humorista mais amado do Brasil. Do estilo Witbier, de inspiração belga, é refrescante, fácil de beber e perfeita para encarar o calor deste verão com muito sabor. Uma combinação de aromas e notas cítricos típicos do estilo, realçados pela utilização de laranja e pimenta-da-jamaica na receita.',
                        4.5, 4, 4.9, 14.90, 12,1, 33, 7, 1),
                        (15, 'BRAHMA CHOPP', 'A Brahma Chopp é clara, brilhante, transparente e internacionalmente conhecida como uma cerveja de excelente qualidade. É mais leve, com paladar clássico da baixa fermentação e tem sabor encorpado, aroma neutro, amargor menos acentuado e médio teor alcoólico.',
                        5.0, 0, 4, 5.90, 6, 4, 33, 2, 1),
                        (16, 'HOCUS POCUS INTERSTELLAR', 'A Interstellar é a primeira American IPA feita pela hocus pocus. Utilizando o dobro da quantidade de lúpulos da APA Cadabra em um perfil bem diferente que inclui Azacca e Mosaic, a Interstellar é uma bomba de aromas de manga e maracujá, com sabor de lúpulo extremo para uma IPA de “apenas” 7,0% de ABV.',
                        7, 6, 7, 35.44, 9, 1, 33, 1, 1),
                        (17, 'GUINNESS', 'A guinness é uma cerveja escura do tipo Dry stout que possui textura e espuma cremosas, mas ao mesmo tempo é extremamente leve e tem um perfeito equilíbrio. Sua cor e sabor distintos provem dos maltes de cevada tostada utilizados na fabricação.',
                        4.1, 12, 9, 31.99, 12, 11, 128, 5, 1),
                        (18, 'SAPPORO PREMIUM', 'Sapporo, a mais antiga marca de cerveja no Japão, foi fabricada pela primeira vez em Sapporo, no Japão em 1876 pelo alemão cerveja Seibei Nakagawa. É elaborada a partir de água, lúpulo, malte e levedura selecionada. É uma cerveja de cor dourada, com espuma de média duração. Paladar adocicado e bom amargor final.',
                        4.9, 4, 6, 38.99, 2, 1, 134, 2, 1),
                        (19, 'SCHORNSTEIN IMPERIAL', 'A Schornstein Imperial Stout foi produzida com seis diferentes maltes e dois tipos de lúpulo especialmente selecionados para dar características muito distintas ao aroma e paladar dos apreciadores.',
                        8.0, 8, 9, 27.90, 11, 12, 33, 5, 2),
                        (20, 'EEL RIVER ORGANIC AÇAÍ BERRY WHEAT', 'Eel River Açaí Berry Wheat Ale é uma Cerveja de trigo de corpo leve fabricado com bagas de Açaí orgânico do Brasil, e uma mistura saborosa de romã e outras bagas.',
                        4, 5, 7, 21.99, 10, 4, 69, 9, 55),
                        (21, 'SON OF A BEER (SOB)', 'Uma Cerveja refrescante, leve, fácil de beber. Ela confere um amargor diferenciado do estilo belga, pois é uma típica American Golden Ale. Recebe um belo dry-hopping duplo.',
                        4.7, 3, 5, 25.90, 10, 1, 33, 10, 1),
                        (22, 'SKOL', 'A cerveja Skol é uma cerveja clara, com aroma refinado e sabor leve e suave.',
                        4.7, 0, 4, 5.90, 6, 2, 33, 2, 1);
						
            
			