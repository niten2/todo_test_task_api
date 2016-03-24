require "rails_helper"

describe UserMailer do

  let(:user) { create(:user) }

  let(:mail) { UserMailer.report("11/01/2005", "11/01/2020", "test@mail.com") }

  it "renders the headers" do
    expect(mail.subject).to eq "Аналитический отчёт c 11/01/2005 по 11/01/2020"
    expect(mail.to).to eq ["test@mail.com"]
    expect(mail.from).to eq ["from@example.com"]
  end

  it "renders the body " do
    expect(mail.body.encoded).to match("nickname")
    expect(mail.body.encoded).to match("email")
    expect(mail.body.encoded).to match("количество записей за период")
    expect(mail.body.encoded).to match("количество комментариев за период")
  end

end
