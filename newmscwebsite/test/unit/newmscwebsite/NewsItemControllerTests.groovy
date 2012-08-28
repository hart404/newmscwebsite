package newmscwebsite



import org.junit.*
import grails.test.mixin.*

@TestFor(NewsItemController)
@Mock(NewsItem)
class NewsItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/newsItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.newsItemInstanceList.size() == 0
        assert model.newsItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.newsItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.newsItemInstance != null
        assert view == '/newsItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/newsItem/show/1'
        assert controller.flash.message != null
        assert NewsItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/newsItem/list'


        populateValidParams(params)
        def newsItem = new NewsItem(params)

        assert newsItem.save() != null

        params.id = newsItem.id

        def model = controller.show()

        assert model.newsItemInstance == newsItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/newsItem/list'


        populateValidParams(params)
        def newsItem = new NewsItem(params)

        assert newsItem.save() != null

        params.id = newsItem.id

        def model = controller.edit()

        assert model.newsItemInstance == newsItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/newsItem/list'

        response.reset()


        populateValidParams(params)
        def newsItem = new NewsItem(params)

        assert newsItem.save() != null

        // test invalid parameters in update
        params.id = newsItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/newsItem/edit"
        assert model.newsItemInstance != null

        newsItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/newsItem/show/$newsItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        newsItem.clearErrors()

        populateValidParams(params)
        params.id = newsItem.id
        params.version = -1
        controller.update()

        assert view == "/newsItem/edit"
        assert model.newsItemInstance != null
        assert model.newsItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/newsItem/list'

        response.reset()

        populateValidParams(params)
        def newsItem = new NewsItem(params)

        assert newsItem.save() != null
        assert NewsItem.count() == 1

        params.id = newsItem.id

        controller.delete()

        assert NewsItem.count() == 0
        assert NewsItem.get(newsItem.id) == null
        assert response.redirectedUrl == '/newsItem/list'
    }
}
