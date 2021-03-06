require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "creates valid record" do
    note = Note.new
    note.title = "Hello World"
    note.tag = "#hiWorld"
    note.inputText = "#Hello World# "
    assert note.save
  end

  test "should not save unless title is filled in" do
    note = Note.new
    assert !note.save
    assert note.errors[:title].include?("can't be blank")
  end

  test "should not save unless tag is filled in" do
    note = Note.new
    assert !note.save
    assert note.errors[:tag].include?("can't be blank")
  end

    test "should not save unless inputText is has content in" do
    note = Note.new
    assert !note.save
    assert note.errors[:inputText].include?("can't be blank")
  end

  test "creates an invalid record- title > 250 characters" do
    note = Note.new
    note.title = "this is klingon: Cha'dich lolmoh mevyap nahnagh qaryoq qul tuq qid tijwi'ghom ting 'arlogh 'e'mam 'iqnah. Chegh chuq'a' ghet ghojmeh taj jer lol marwi' ngop pa' red piq qaryoq'a' qawhaq quy'ip qap raw' sosbor'a'"
        note.tag = "#klignon"
        note.inputText = "#Hello World# "
        assert !note.save
  end

  test "should find a match on title" do
    test_note = Note.create(title: "Klingon",
                                tag: "#WorfWasAwesome",
                                inputText: "this is klingon: Cha'dich lolmoh mevyap nahnagh qaryoq qul tuq qid tijwi'ghom ting 'arlogh 'e'mam 'iqnah. Chegh chuq'a' ghet ghojmeh taj jer lol marwi' ngop pa' red piq qaryoq'a'")
    assert_equal test_note, Note.find_all_by_query("klingon").first
  end

  test "should find 2 matches on title" do
    Note.create!(title: "Klingon",
                 tag: "#todayIsAGoodDayToDie",
                 inputText: "Cha'dich lolmoh mevyap nahnagh qaryoq qul tuq qid tijwi'ghom ting 'arlogh 'e'mam 'iqnah. Chegh chuq'a' ghet ghojmeh taj jer lol marwi' ngop pa' red piq qaryoq'a' qawhaq quy'ip qap raw' sosbor'a'")
                 
    Note.create!(title: "theKlingonEmpire",
                   tag: "#todayIsAGoodDayToDie",
                   inputText: "Cha'dich lolmoh mevyap nahnagh qaryoq qul tuq qid tijwi'ghom ting 'arlogh 'e'mam 'iqnah. Chegh chuq'a' ghet ghojmeh taj jer lol marwi' ngop pa' red piq qaryoq'a' qawhaq quy'ip qap raw' sosbor'a")
    assert_equal 2, Note.find_all_by_query("klingon").count
  end

  test "should find a match on tags" do
    test_note = Note.create(title: "elves are cool too",
                            tag: "elvish",
                            inputText: "Entula a' moinayamen' amin autien rath Saurarea Ya? Caela ie'lle Tel'Domeduathea lle quel andune. Tyela neuma lle lakwenien Yaaraerea goth en gothamin. Lle vesta Nikerym Ita'istar saesa omentien lle.Nenime uuner uma, n'dela no'ta manka lle merna elea i'dolen. Tanya awra! Iire uuner uma, n'dela no'ta tanya nae sai eina. Aa' menle nauva calen ar' ta hwesta e' ale'quenle Saurarea lle naa haran e' nausalle N'hrive. Nandaror Dina asca melloneamin Viresse.")
    assert_equal test_note, Note.find_all_by_query("elvish").first
  end

  test "should find a match on inputText" do
    test_note = Note.create(title: "elves are cool too",
                            tag: "elvish",
                            inputText: "Entula a' moinayamen' amin autien rath Saurarea Ya? Caela ie'lle Tel'Domeduathea lle quel andune. Tyela neuma lle lakwenien Yaaraerea goth en gothamin. Lle vesta Nikerym Ita'istar saesa omentien lle.Nenime uuner uma, n'dela no'ta manka lle merna elea i'dolen. Tanya awra! Iire uuner uma, n'dela no'ta tanya nae sai eina. Aa' menle nauva calen ar' ta hwesta e' ale'quenle Saurarea lle naa haran e' nausalle N'hrive. Nandaror Dina asca melloneamin Viresse.")
    assert_equal test_note, Note.find_all_by_query("ta").first
  end


  test "should be inTrashcan" do
    test_note = Note.create(title: "TrashNote",
                            tag: "Trash",
                            inputText: "# Trash this note!")
    test_note.inTrashcan = true
    
    assert true, test_note.inTrashcan
  end
  
  test "3 notes should be inTrashcan" do
    note1 = Note.create(title: "TrashNote1",
                            tag: "Trash",
                            inputText: "# Trash this note!")
    note2 = Note.create(title: "TrashNote2",
                            tag: "Trash",
                            inputText: "# Trash this note!")
    note3 = Note.create(title: "TrashNote3",
                            tag: "Trash",
                            inputText: "# Trash this note!")
    note1.inTrashcan = true
    note2.inTrashcan = true
    note3.inTrashcan = true
    
    assert 3, Note.where("inTrashcan").count
  end
end
