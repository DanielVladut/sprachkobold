import { VerbPreposition } from './VerbPreposition';
import { Word } from './../../words-common';

export class Verb extends Word {

    public PreteritumForm: string;
    public PastPerfectForm: string;
    public Prepositions: VerbPreposition[];
}