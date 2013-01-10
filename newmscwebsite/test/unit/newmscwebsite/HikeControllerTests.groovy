package newmscwebsite



import org.junit.*
import grails.test.mixin.*

@TestFor(HikeController)
@Mock(Hike)
class HikeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/hike/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.hikeInstanceList.size() == 0
        assert model.hikeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.hikeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.hikeInstance != null
        assert view == '/hike/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/hike/show/1'
        assert controller.flash.message != null
        assert Hike.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/hike/list'


        populateValidParams(params)
        def hike = new Hike(params)

        assert hike.save() != null

        params.id = hike.id

        def model = controller.show()

        assert model.hikeInstance == hike
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/hike/list'


        populateValidParams(params)
        def hike = new Hike(params)

        assert hike.save() != null

        params.id = hike.id

        def model = controller.edit()

        assert model.hikeInstance == hike
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/hike/list'

        response.reset()


        populateValidParams(params)
        def hike = new Hike(params)

        assert hike.save() != null

        // test invalid parameters in update
        params.id = hike.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/hike/edit"
        assert model.hikeInstance != null

        hike.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/hike/show/$hike.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        hike.clearErrors()

        populateValidParams(params)
        params.id = hike.id
        params.version = -1
        controller.update()

        assert view == "/hike/edit"
        assert model.hikeInstance != null
        assert model.hikeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/hike/list'

        response.reset()

        populateValidParams(params)
        def hike = new Hike(params)

        assert hike.save() != null
        assert Hike.count() == 1

        params.id = hike.id

        controller.delete()

        assert Hike.count() == 0
        assert Hike.get(hike.id) == null
        assert response.redirectedUrl == '/hike/list'
    }
}
