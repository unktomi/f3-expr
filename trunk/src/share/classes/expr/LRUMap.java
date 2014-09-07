package expr;
import java.util.*;

public class LRUMap<K, V> extends LinkedHashMap<K, V> {
    final int maxSize;
    public LRUMap(int maxSize) {
        super((maxSize*4)/3, .75f, true);
        this.maxSize = maxSize;
    }
    @Override
        protected boolean removeEldestEntry(Map.Entry<K, V> ent) {
        final boolean result = size() > maxSize;
        if (result) System.err.println("removing: "+ent);
        return result;
    }
}
