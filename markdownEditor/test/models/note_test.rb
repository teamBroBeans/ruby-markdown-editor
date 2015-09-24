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
      note.title = "this is klingon: Cha'dich lolmoh mevyap nahnagh qaryoq qul tuq qid tijwi'ghom ting 'arlogh 'e'mam 'iqnah. Chegh chuq'a' ghet ghojmeh taj jer lol marwi' ngop pa' red piq qaryoq'a' qawhaq quy'ip qap raw' sosbor'a' tagh tlhach mu'mey va vem'eq waqboch yatqap. Bo denibngan loltah qirq sosbor tiqnagh lemdu' tlhup vad yer 'orghengan. Bop chuq'a' dugh ghitlhwi' magh notqa' pur red tagh tahqeq tlhup. Divi' homwi' lev logh marwi' naw' pa' beb qa'rol qeylis qirq roswi' tennus tlhach mu'mey yiq yuqjijqa' 'edjen 'iqnah 'orghenya'ngan. Be'joy' boq'egh chang'eng cha'qu' chen chuy denib qatlh denibya' der ghitlhwi' jer lev lolchu' nan naq nga'chuq qa'meh rav'eq ron segh senwi' rilwi' je tahqeq tey' torgh wovmohwi' yiq yuqjijdivi' 'ud'a'.
        
"
        note.tag = "#klignon"
        note.inputText = "#Hello World# "
        assert !note.save
    end





end
