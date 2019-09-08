import * as express from "express";

export abstract class Controller {
    
    public get Router(): express.Router {
        return this.router;
    }
    constructor(private router:  express.Router) { 
        this.initializeRoutes(router);
    }

    protected abstract initializeRoutes(router:  express.Router);
}