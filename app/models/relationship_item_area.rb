class RelationshipItemArea < ApplicationRecord
	belongs_to :item
	belongs_to :area

	enum area_id: { hokkaido: 0, aomori: 1, iwate: 2, miyagi: 3, akita: 4, yamagata: 5, hukushima: 6, 
									ibaraki: 7, tochigi: 8, gunma: 9, saitama: 10, chiba: 11, tokyo: 12, kanagawa: 13, 
									niigata: 14, toyama: 15, ishikawa: 16, hukui: 17, yamanashi: 18, nagano: 19, 
									gihu: 20, shizuoka: 21, aichi: 22, mie: 23, shiga: 24, kyoto: 25, osaka: 26, 
									hyogo: 27, nara: 28, wakayama: 29, tottori: 30, simane: 31, okayama: 32, 
									hiroshima: 33, yamaguchi: 34, tokushima: 35, kagawa: 36, ehime: 37, kouchi: 38, 
									hukuoka: 39, saga: 40, nagasaki: 41, kumamoto: 42, oita: 43, miyazaki: 44, 
									kagoshima: 45, okinawa: 46}
	validates :area_id, inclusion: { in: RelationshipItemArea.area_ids.keys }
end
