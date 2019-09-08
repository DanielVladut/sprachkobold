import { Article } from './Article';
import { Word, Tag } from '../../words-common';

export class Noun extends Word{
	public Article: Article;
	public PluralForm: string  
}