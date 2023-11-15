require "rails_helper"

RSpec.describe TouristSite do
  it "takes a hash and makes a ruby object" do
    site_data =  {:type=>"Feature",
    :properties=>
     {:name=>"Trīs brāļi",
      :country=>"Latvia",
      :country_code=>"lv",
      :state=>"Vidzeme",
      :city=>"Riga",
      :postcode=>"LV-1050",
      :suburb=>"Old Riga",
      :street=>"Mazā Pils iela",
      :lon=>24.10429057212537,
      :lat=>56.950349200000005,
      :formatted=>"Three Brothers, Mazā Pils iela, Riga, LV-1050, Latvia",
      :address_line1=>"Three Brothers",
      :address_line2=>"Mazā Pils iela, Riga, LV-1050, Latvia",
      :categories=>["heritage", "tourism", "tourism.attraction", "tourism.sights"],
      :details=>["details", "details.heritage", "details.wiki_and_media"],
      :datasource=>
       {:sourcename=>"openstreetmap",
        :attribution=>"© OpenStreetMap contributors",
        :license=>"Open Database Licence",
        :url=>"https://www.openstreetmap.org/copyright",
        :raw=>
         {:name=>"Trīs brāļi",
          :image=>"https://commons.wikimedia.org/wiki/File:Рыжскія замалёўкі_10.jpg",
          :osm_id=>348059067,
          :"name:be"=>"Тры браты",
          :"name:de"=>"Drei Brüder",
          :"name:en"=>"Three Brothers",
          :"name:fr"=>"Les trois frères",
          :"name:lv"=>"Trīs brāļi",
          :"name:ru"=>"Три брата",
          :tourism=>"attraction",
          :heritage=>2,
          :historic=>"yes",
          :osm_type=>"w",
          :wikidata=>"Q282196",
          :wikipedia=>"lv:Trīs brāļi",
          :"heritage:operator"=>"vkpai",
          :wikimedia_commons=>"Category:Three_Brothers_(Riga)"}},
          :place_id=>"51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69"},
          :geometry=>{:type=>"Point", :coordinates=>[24.10428923293326, 56.9503194093613]}}

    site = TouristSite.new(site_data)

    expect(site).to be_a(TouristSite)
    expect(site.name).to eq("Trīs brāļi")
    expect(site.address).to eq("Three Brothers Mazā Pils iela, Riga, LV-1050, Latvia")
    expect(site.place_id).to eq("51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69")
    expect(site.id).to eq(nil)
  end

  it "can handle line with one address" do
    site_data =  {:type=>"Feature",
    :properties=>
     {:name=>"Trīs brāļi",
      :country=>"Latvia",
      :country_code=>"lv",
      :state=>"Vidzeme",
      :city=>"Riga",
      :postcode=>"LV-1050",
      :suburb=>"Old Riga",
      :street=>"Mazā Pils iela",
      :lon=>24.10429057212537,
      :lat=>56.950349200000005,
      :formatted=>"Three Brothers, Mazā Pils iela, Riga, LV-1050, Latvia",
      :address_line1=>"Three Brothers",
      :categories=>["heritage", "tourism", "tourism.attraction", "tourism.sights"],
      :details=>["details", "details.heritage", "details.wiki_and_media"],
      :datasource=>
       {:sourcename=>"openstreetmap",
        :attribution=>"© OpenStreetMap contributors",
        :license=>"Open Database Licence",
        :url=>"https://www.openstreetmap.org/copyright",
        :raw=>
         {:name=>"Trīs brāļi",
          :image=>"https://commons.wikimedia.org/wiki/File:Рыжскія замалёўкі_10.jpg",
          :osm_id=>348059067,
          :"name:be"=>"Тры браты",
          :"name:de"=>"Drei Brüder",
          :"name:en"=>"Three Brothers",
          :"name:fr"=>"Les trois frères",
          :"name:lv"=>"Trīs brāļi",
          :"name:ru"=>"Три брата",
          :tourism=>"attraction",
          :heritage=>2,
          :historic=>"yes",
          :osm_type=>"w",
          :wikidata=>"Q282196",
          :wikipedia=>"lv:Trīs brāļi",
          :"heritage:operator"=>"vkpai",
          :wikimedia_commons=>"Category:Three_Brothers_(Riga)"}},
          :place_id=>"51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69"},
          :geometry=>{:type=>"Point", :coordinates=>[24.10428923293326, 56.9503194093613]}}

    site = TouristSite.new(site_data)

    expect(site).to be_a(TouristSite)
    expect(site.name).to eq("Trīs brāļi")
    expect(site.address).to eq("Three Brothers")
    expect(site.place_id).to eq("51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69")
    expect(site.id).to eq(nil)
  end

  it "can handle no address" do
    site_data =  {:type=>"Feature",
    :properties=>
     {:name=>"Trīs brāļi",
      :country=>"Latvia",
      :country_code=>"lv",
      :state=>"Vidzeme",
      :city=>"Riga",
      :postcode=>"LV-1050",
      :suburb=>"Old Riga",
      :street=>"Mazā Pils iela",
      :lon=>24.10429057212537,
      :lat=>56.950349200000005,
      :formatted=>"Three Brothers, Mazā Pils iela, Riga, LV-1050, Latvia",
      :categories=>["heritage", "tourism", "tourism.attraction", "tourism.sights"],
      :details=>["details", "details.heritage", "details.wiki_and_media"],
      :datasource=>
       {:sourcename=>"openstreetmap",
        :attribution=>"© OpenStreetMap contributors",
        :license=>"Open Database Licence",
        :url=>"https://www.openstreetmap.org/copyright",
        :raw=>
         {:name=>"Trīs brāļi",
          :image=>"https://commons.wikimedia.org/wiki/File:Рыжскія замалёўкі_10.jpg",
          :osm_id=>348059067,
          :"name:be"=>"Тры браты",
          :"name:de"=>"Drei Brüder",
          :"name:en"=>"Three Brothers",
          :"name:fr"=>"Les trois frères",
          :"name:lv"=>"Trīs brāļi",
          :"name:ru"=>"Три брата",
          :tourism=>"attraction",
          :heritage=>2,
          :historic=>"yes",
          :osm_type=>"w",
          :wikidata=>"Q282196",
          :wikipedia=>"lv:Trīs brāļi",
          :"heritage:operator"=>"vkpai",
          :wikimedia_commons=>"Category:Three_Brothers_(Riga)"}},
          :place_id=>"51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69"},
          :geometry=>{:type=>"Point", :coordinates=>[24.10428923293326, 56.9503194093613]}}

    site = TouristSite.new(site_data)

    expect(site).to be_a(TouristSite)
    expect(site.name).to eq("Trīs brāļi")
    expect(site.address).to eq("No Address")
    expect(site.place_id).to eq("51f6c5fcb2b21a384059fcfaff10a4794c40f00102f901bbf5be140000000092030d5472c4ab73206272c481c4bc69")
    expect(site.id).to eq(nil)
  end
end