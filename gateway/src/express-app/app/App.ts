import * as express from "express";
import * as bodyParser from "body-parser";
import * as debug from 'debug';
import * as morgan from 'morgan';
import { AppConfig } from '../config/AppConfig';
import { Controller } from "../controllers/Controller";

export class App {

    private app: express.Express;
    private debugger: debug.IDebugger

    constructor(
        private controllers: Controller[],
        private config: AppConfig) {
        this.app = express();
        this.debugger = debug('app:main');
        this.configMiddlewares();
        this.configureRoutes();
    }

    private configMiddlewares(): void {
        this.app.use(morgan('combined'));
        this.app.use(bodyParser.json());
        this.app.use(bodyParser.urlencoded({ extended: false }));
    }

    private configureRoutes(): void {
        this.controllers.forEach((controller) => {
            this.app.use('/', controller.Router);
        });
    }

    public startServer(): void {
        this.app.listen(this.config.Port, () => {
            this.debugger(`Express server started, listening on port: ${this.config.Port}`);
        })
    }

}