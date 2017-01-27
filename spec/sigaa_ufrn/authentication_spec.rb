require "spec_helper"

RSpec.describe SigaaUfrn::Authentication, vcr: true do
  describe '.client_credentials' do
    subject { described_class.client_credentials(client_id, client_secret) }

    context 'when wrong credentials' do
      let(:client_id) { 'foo-bar' }
      let(:client_secret) { 'foo-bar' }

      it 'return invalid client body' do
        expect(subject.body).to eq({"error"=>"invalid_client", "error_description"=>"Bad client credentials"})
      end

      it 'get 401' do
        expect(subject.status).to eq(401)
      end
    end

    context 'when correct credentials' do
      let(:client_id) { 'visitante-id' }
      let(:client_secret) { '53cr3t' }

      it 'return client token params' do
        expect(subject.body).to eq({
         'access_token' => '985c690a-9879-4868-bc58-706d5b353152',
         'token_type' => 'bearer',
         'expires_in' => 7774108,
         'scope' => 'read'
        })
      end

      it 'get 200' do
        expect(subject.status).to eq(200)
      end
    end
  end
end
