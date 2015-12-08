require "spec_helper.rb"


describe References_APA do
    before :each do
       @reference_list = References_APA.new
       @libro = Libro.new('Scott Chacon', 'Pro Git 2009th Edition', 'Pro', 'Apress', '2009 edition', 'August 27, 2009', ['978-1430218333', '1430218339'])
    end    
end        