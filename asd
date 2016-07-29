options:
	prefix: &9&lRANK &6&l>
	paranyok: &cRank atlamak için yeteri kadar paran yok!
	sonrank: &aZaten en yüksek rütbedesin :)
	
command /rankup:
	trigger:
		if {acemi.%player%} is not set:
			if player's balance is bigger than or equal to 50000:
				set {acemi.%player%} to true
				delete {profesyonel.%player%}
				execute console command "eco take %player% 50000"
				execute console command "rankatlat %player% Acemi"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {profesyonel.%player%} is not set:
			if player's balance is bigger than or equal to 225000:
				set {profesyonel.%player%} to true
				delete {soylu.%player%}
				execute console command "eco take %player% 225000"
				execute console command "rankatlat %player% Profesyonel"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {soylu.%player%} is not set:
			if player's balance is bigger than or equal to 440000:
				set {soylu.%player%} to true
				delete {bilgin.%player%}
				execute console command "eco take %player% 440000"
				execute console command "rankatlat %player% Soylu"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {bilgin.%player%} is not set:
			if player's balance is bigger than or equal to 790000:
				set {bilgin.%player%} to true
				delete {asil.%player%}
				execute console command "eco take %player% 790000"
				execute console command "rankatlat %player% Bilgin"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {asil.%player%} is not set:
			if player's balance is bigger than or equal to 1500000:
				set {asil.%player%} to true
				delete {kahraman.%player%}
				execute console command "eco take %player% 1500000"
				execute console command "rankatlat %player% Asil"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {kahraman.%player%} is not set:
			if player's balance is bigger than or equal to 5500000:
				set {kahraman.%player%} to true
				delete {lord.%player%}
				execute console command "eco take %player% 5500000"
				execute console command "rankatlat %player% Kahraman"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {lord.%player%} is not set:
			if player's balance is bigger than or equal to 15000000:
				set {lord.%player%} to true
				delete {efsanevi.%player%}
				execute console command "eco take %player% 15000000"
				execute console command "rankatlat %player% Lord"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {efsanevi.%player%} is not set:
			if player's balance is bigger than or equal to 25000000:
				set {efsanevi.%player%} to true
				set {rank.son.%player%} to  true
				execute console command "eco take %player% 25000000"
				execute console command "rankatlat %player% Efsanevi"
				stop
			else:
				send " {@prefix} {@paranyok}"
		if {rank.son.%player%} is set:
			send " {@prefix} {@sonrank}"
			
command /ranks:
	trigger:
		open chest with 3 row named "&9&lRANK LISTESI" to player
		format slot 1 of player with redstone named "&51.RANK: &6Acemi" with lore "&5Acemi rütbesine ulaşmak için||&250K &5paraya sahip olmalısınız." to be unstealable
		format slot 3 of player with redstone named "&52.RANK: &6Profesyonel" with lore "&5Profesyonel rütbesine ulaşmak için||&2225K &5paraya sahip olmalısınız."  to be unstealable
		format slot 5 of player with redstone named "&53.RANK: &6Soylu" with lore "&5Soylu rütbesine ulaşmak için||&2440K &5paraya sahip olmalısınız."  to be unstealable
		format slot 7 of player with redstone named "&54.RANK: &6Bilgin" with lore "&5Bilgin rütbesine ulaşmak için||&2790K &5paraya sahip olmalısınız."  to be unstealable
		format slot 10 of player with redstone named "&55.RANK: &6Asil" with lore "&5Asil rütbesine ulaşmak için||&21M 500K &5paraya sahip olmalısınız."  to be unstealable
		format slot 12 of player with redstone named "&56.RANK: &6Kahraman" with lore "&5Kahraman rütbesine ulaşmak için||&25M 500K &5paraya sahip olmalısınız."  to be unstealable
		format slot 14 of player with redstone named "&57.RANK: &6Lord" with lore "&5Lord rütbesine ulaşmak için||&215M &5paraya sahip olmalısınız."  to be unstealable
		format slot 16 of player with redstone named "&58.RANK: &6Efsanevi" with lore "&5Efsanevi rütbesine ulaşmak için||&225M &5paraya sahip olmalısınız."  to be unstealable
		format slot 26 of player with diamond named "&3&lÇIKIŞ" to close
		
command /rankatlat [<text>] [<text>]:
	executable by: console
	trigger:
		execute console command "manselect world"
		execute console command "manuadd %arg 1% %arg 2%"
		execute console command "manselect Spawn"
		execute console command "manuadd %arg 1% %arg 2%"
		execute console command "manselect Arsalar"
		execute console command "manuadd %arg 1% %arg 2%"
		broadcast " {@prefix} &a%arg 1% &b, &4%arg 2% &brankına yükseldi! "
		
command /ranksifirla [<offlineplayer>]:
	permission: sk.rank.admin
	permission message: &cBunu yapmak için yetkin yok!
	trigger:
		if arg 1 is set:
			delete {acemi.%arg 1%}
			delete {rank.son.%arg 1%}
			set {profesyonel.%arg 1%} to true
			set {soylu.%arg 1%} to true
			set {bilgin.%arg 1%} to true
			set {asil.%arg 1%} to true
			set {kahraman.%arg 1%} to true
			set {lord.%arg 1%} to true
			set {efsanevi.%arg 1%} to true
			send " &7> &a%arg 1% &6adlı kişinin rütbesini sıfırladın."
		else:
			send " &7> &cOyuncu ismi yazmadin!"
			
on first join:
	delete {acemi.%player%}
	delete {rank.son.%player%}
	set {profesyonel.%player%} to true
	set {soylu.%player%} to true
	set {bilgin.%player%} to true
	set {asil.%player%} to true
	set {kahraman.%player%} to true
	set {lord.%player%} to true
	set {efsanevi.%player%} to true
