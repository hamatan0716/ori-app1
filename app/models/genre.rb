class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ジャンルを選択してください' },
    { id: 2, name: 'PC周辺機器' },
    { id: 3, name: 'オーディオ' },
    { id: 4, name: '家電' },
    { id: 5, name: '文房具' },
    { id: 6, name: 'キッチン用品' },
    { id: 7, name: 'カバン' },
    { id: 8, name: '収納' },
    { id: 9, name: 'インテリア' },
    { id: 10, name: '時計' },
    { id: 11, name: 'その他' }
  ]
  
  include ActiveHash::Associations
  has_many :items
end