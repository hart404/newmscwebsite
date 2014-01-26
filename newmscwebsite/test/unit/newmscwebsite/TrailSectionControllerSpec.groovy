package newmscwebsite



import grails.test.mixin.*
import spock.lang.*

@TestFor(TrailSectionController)
@Mock(TrailSection)
class TrailSectionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.trailSectionInstanceList
            model.trailSectionInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.trailSectionInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def trailSection = new TrailSection()
            trailSection.validate()
            controller.save(trailSection)

        then:"The create view is rendered again with the correct model"
            model.trailSectionInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            trailSection = new TrailSection(params)

            controller.save(trailSection)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/trailSection/show/1'
            controller.flash.message != null
            TrailSection.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def trailSection = new TrailSection(params)
            controller.show(trailSection)

        then:"A model is populated containing the domain instance"
            model.trailSectionInstance == trailSection
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def trailSection = new TrailSection(params)
            controller.edit(trailSection)

        then:"A model is populated containing the domain instance"
            model.trailSectionInstance == trailSection
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/trailSection/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def trailSection = new TrailSection()
            trailSection.validate()
            controller.update(trailSection)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.trailSectionInstance == trailSection

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            trailSection = new TrailSection(params).save(flush: true)
            controller.update(trailSection)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/trailSection/show/$trailSection.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/trailSection/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def trailSection = new TrailSection(params).save(flush: true)

        then:"It exists"
            TrailSection.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(trailSection)

        then:"The instance is deleted"
            TrailSection.count() == 0
            response.redirectedUrl == '/trailSection/index'
            flash.message != null
    }
}
