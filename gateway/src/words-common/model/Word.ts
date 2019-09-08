import { Expression } from './Expression';
import { Tag } from "./Tag";
import { Example } from './Example';

export abstract class Word {    
    public OriginalWord: string;
    public Translations: string[];
    public Tags: Tag[];
    public Expressions: Expression[];
    public Examples: Example[];
}