feature 'Multiple tags' do

	scenario 'link has multiple tags' do
		create_link_makers

		link = Link.first
		expect(link.tags.map(&:name)).to include('coding','education')
	end

end