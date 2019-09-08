import { App } from './app/App';
import { appConfig } from './config/Config';
import { NounController } from './controllers/NounController';
import * as express from "express";

export function bootstrap(): App {        
    return new App([
        new NounController(express.Router())
    ]
    , appConfig); 
};