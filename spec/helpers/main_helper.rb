class MainHelper
  class << self

    def api_key
      '16f02176d0393839dda514bef56f3d90'
    end

    def test_factory entity, attrs = {}

      attrs[:hash_for_update_test] ||= {name: 'update_test'}
      attrs[:actions] ||= [:all]

      fixture = MainHelper.load_fixture attrs[:fixture_name]

      # create new entity
      #expect(entity.create fixture).to include(fixture.first)
      #expect(entity.size!).to equal(1)

      # list of entities
      #if attrs[:actions].include?
      expect(entity.all).to be_a_kind_of(Array)

      # read first entity
      #expect(entity.read entity.first.id).to include(entity.entity_name)

      # update first entity
      #unit = entity.units.first
      #unit.update attrs[:hash_for_update_test]
      #expect(unit.read).to include(attrs[:hash_for_update_test])

      # delete all entities

      #entity.units.each(&:delete)
      #expect(entity.size!).to equal(0)

    end

    def load_fixture name
      YAML::load(File.open("spec/fixtures/#{name}.yml", "rb").read)
    end

  end
end