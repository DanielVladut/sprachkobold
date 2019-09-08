import * as express from "express";
import { Controller } from "./Controller";

export class NounController extends Controller {    
    constructor(router:  express.Router) {
        super(router);
    }

    protected initializeRoutes(router:  express.Router){
        router.route('/nouns')
            .get(this.getNouns)
            .post(this.addNoun);

        router.route('/nouns/:id')
            .get(this.getNoun)
            .put(this.updateNoun)
            .delete(this.deleteNoun);
    }

    public getNouns(req: express.Request, resp: express.Response) {
        resp.status(200).json([{ Name: "kind", Translation: "Child" }, { Name: "Tisch", Translation: "Table" }]);
    }

    public getNoun(req: express.Request, resp: express.Response) {
        resp.status(200).json({ Name: "kind", Translation: "Child" });
    }

    public addNoun(req: express.Request, resp: express.Response) {
        resp.status(200).json({ Name: "kind", Translation: "Child" });
    } 

    public updateNoun(req: express.Request, resp: express.Response) {
        resp.status(200).send("updated!");
    }

    public deleteNoun(req: express.Request, resp: express.Response) {
        resp.status(200).send('deleted!');
    }
}